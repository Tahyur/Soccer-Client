/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.service.intfc;

import com.tahyur.soccer.soccerclient.model.Match;
import com.tahyur.soccer.soccerclient.model.Soccer;
import com.tahyur.soccer.soccerclient.model.Standing;
import java.util.List;

/**
 *
 * @author tayor
 */
public interface ISoccerService {
    Soccer getCompetitionsPerLeague(String id);
    List<Match> getMatchesResults(String id, String from, String to);
    Standing getLeagueStandings(String id);
    List<Match> getTeamOneRecord(String name);
    List<Match> getTeamTwoRecord(String name);
    List<Match> getHeadToHead(String teamOne, String teamTwo);
}
