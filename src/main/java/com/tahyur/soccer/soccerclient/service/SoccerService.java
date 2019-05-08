/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.service;

import com.tahyur.soccer.soccerclient.deserialize.Deserialize;
import com.tahyur.soccer.soccerclient.model.Match;
import com.tahyur.soccer.soccerclient.model.Soccer;
import com.tahyur.soccer.soccerclient.model.Standing;
import com.tahyur.soccer.soccerclient.model.Team;
import com.tahyur.soccer.soccerclient.service.intfc.ISoccerService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author tayor
 */
@Service
public class SoccerService implements ISoccerService {

    @Autowired
    Deserialize deserialize;

    private final String COMPETITIONS_URL_ENDPOINT = "http://localhost:8080/soccer/competitions";
    private final String MATCHES_URL_ENDPOINT = "http://localhost:8080/soccer/matches";
    private final String STANDINGS_URL_ENDPOINT = "http://localhost:8080/soccer/standings";
    private final String TEAM_ONE_URL_ENDPOINT = "http://localhost:8080/soccer/record/one";
    private final String TEAM_TWO_URL_ENDPOINT = "http://localhost:8080/soccer/record/two";
    private final String H2H_URL_ENDPOINT = "http://localhost:8080/soccer/h2h";

    @Override
    public Soccer getCompetitionsPerLeague(String id) {

        String resourceUrl = COMPETITIONS_URL_ENDPOINT + "/" + id;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(resourceUrl, String.class);

        if (!data.isEmpty()) {
            Soccer soccer = deserialize.deseriailzeSoccerEntity(data);
            return soccer;
        }
        return null;
    }

    @Override
    public List<Match> getMatchesResults(String id, String from, String to) {
        String resourceUrl = MATCHES_URL_ENDPOINT + "/" + id + "/" + from + "/" + to;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(resourceUrl, String.class);

        if (!data.isEmpty()) {
            List<Match> match = deserialize.deserializeMatchEntity(data);
            return match;
        }
        return null;
    }

    @Override
    public Standing getLeagueStandings(String id) {
        String resourceUrl = STANDINGS_URL_ENDPOINT + "/" + id;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(resourceUrl, String.class);

        if (!data.isEmpty()) {
            Standing standing = deserialize.deserializeStandingEntity(data);
            return standing;
        }
        return null;
    }

    public List<Team> getTeams(String id) {
        Standing standing = getLeagueStandings(id);
        List<Team> teams = new ArrayList<>();
        if (standing != null) {
            for (int i = 0; i < standing.getStandings().size(); i++) {
                Team team = new Team();
                team.setTeamName(standing.getStandings().get(i).getTeamName());
                if(!teams.contains(team))
                     teams.add(team);
            }
        }
        return teams;
    }

    @Override
    public List<Match> getTeamOneRecord(String name) {
        String resourceUrl = TEAM_ONE_URL_ENDPOINT + "/" + name;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(resourceUrl, String.class);

        if (!data.isEmpty()) {
            List<Match> matches = deserialize.deserializeTeamOneEntity(data, name);
            return matches;
        }
        return null;
    }

    @Override
    public List<Match> getTeamTwoRecord(String name) {
        String resourceUrl = TEAM_TWO_URL_ENDPOINT + "/" + name;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(resourceUrl, String.class);

        if (!data.isEmpty()) {
            List<Match> matches = deserialize.deserializeTeamTwoEntity(data, name);
            return matches;
        }
        return null;
    }

    @Override
    public List<Match> getHeadToHead(String teamOne, String teamTwo) {
        String resourceUrl = H2H_URL_ENDPOINT + "/" + teamOne+ "/" +teamTwo;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(resourceUrl, String.class);
        
        if (!data.isEmpty()) {
            List<Match> matches = deserialize.deserializeHeadToHeadEntity(data);
            return matches;
        }
        return null;
    }
}
