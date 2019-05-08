/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.deserialize;

import com.tahyur.soccer.soccerclient.model.Goalscorer;
import com.tahyur.soccer.soccerclient.model.Lineup;
import com.tahyur.soccer.soccerclient.model.Match;
import com.tahyur.soccer.soccerclient.model.Soccer;
import com.tahyur.soccer.soccerclient.model.Standing;
import com.tahyur.soccer.soccerclient.model.Statistics;
import com.tahyur.soccer.soccerclient.model.TeamPosition;
import com.tahyur.soccer.soccerclient.model.Weather;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

/**
 *
 * @author tayor
 */
@Component
public class Deserialize {

    public Soccer deseriailzeSoccerEntity(String jsonString) {
        JSONArray array1 = new JSONArray(jsonString);
        JSONObject obj = array1.getJSONObject(0);
        Soccer soccer = new Soccer();

        soccer.setCountryName(obj.getString("country_name"));
        soccer.setLeagueName(obj.getString("league_name"));

        return soccer;

    }

    public Weather deserialializeWeatherEntity(String jsonString) {
        JSONObject root = new JSONObject(jsonString);
        JSONObject main = root.getJSONObject("main");

        Weather weather = new Weather();
        double avgTemp = main.getDouble("temp");
        double minTemp = main.getDouble("temp_min");
        double maxTemp = main.getDouble("temp_max");

        weather.setAverageTemperature((int) avgTemp);
        weather.setMinTemperature((int) minTemp);
        weather.setMaxTemperature((int) maxTemp);

        return weather;
    }

    public List<Match> deserializeMatchEntity(String jsonString) {
        List<Match> matches = new ArrayList<>();
        JSONArray root = new JSONArray(jsonString);
        for (int i = 0; i < root.length(); i++) {
            JSONObject data = root.getJSONObject(i);
            Match match = new Match();
            match.setCountryName(data.getString("country_name"));
            match.setMatchDate(formatDate(data.getString("match_date")));
            match.setMatchTime(data.getString("match_time"));
            match.setHomeTeam(data.getString("match_hometeam_name"));
            match.setAwayTeam(data.getString("match_awayteam_name"));
            match.setHomeTeamScore(data.getString("match_hometeam_score"));
            match.setAwayTeamScore(data.getString("match_awayteam_score"));
            match.setHomeFormation(data.getString("match_hometeam_system"));
            match.setAwayFormation(data.getString("match_awayteam_system"));
            match.setHomeHalfTimeScore(data.getString("match_hometeam_halftime_score"));
            match.setAwayHalfTimeScore(data.getString("match_awayteam_halftime_score"));
            match.setMatchStatus(data.getString("match_status"));
            match.setHomeTeamLineup(getHomeTeamLineups(data));
            match.setAwayTeamLineup(getAwayTeamLineups(data));
            match.setGoalScorers(getGoalScorers(data));
            match.setStatistics(getStatistics(data));
            matches.add(match);
        }
        return matches;
    }

    public Standing deserializeStandingEntity(String jsonString) {
        List<TeamPosition> list = new ArrayList<>();
        Standing standing = new Standing();
        JSONArray root = new JSONArray(jsonString);
        for (int i = 0; i < root.length(); i++) {
            JSONObject data = root.getJSONObject(i);
            TeamPosition teamPosition = new TeamPosition();
            teamPosition.setCountryName(data.getString("country_name"));
            teamPosition.setLeagueName(data.getString("league_name"));
            teamPosition.setTeamName(data.getString("team_name"));
            teamPosition.setLeaguePosition(Integer.parseInt(data.getString("overall_league_position")));
            teamPosition.setGamesPlayed(data.getString("overall_league_payed"));
            teamPosition.setGamesWon(data.getString("overall_league_W"));
            teamPosition.setGamesLost(data.getString("overall_league_L"));
            teamPosition.setGamesDrawn(data.getString("overall_league_D"));
            teamPosition.setGoalsFor(data.getString("overall_league_GF"));
            teamPosition.setGoalsAgainst(data.getString("overall_league_GA"));
            teamPosition.setGoalDifference(String.valueOf(Integer.parseInt(data.getString("overall_league_GF")) - Integer.valueOf(data.getString("overall_league_GA"))));
            teamPosition.setTotalPoints(data.getString("overall_league_PTS"));
            list.add(teamPosition);
        }

        Collections.sort(list);
        standing.setStandings(list);
        return standing;
    }

    public List<Match> deserializeTeamOneEntity(String jsonString, String currentTeamName) {
        int length;
        List<Match> matches = new ArrayList<>();
        JSONObject root = new JSONObject(jsonString);
        JSONArray teamOne = root.getJSONArray("firstTeam_lastResults");
        
        if(teamOne.length() > 5)
            length = 5;
        else
            length = teamOne.length();
        for (int i = 0; i <length; i++) {
            Match match = new Match();
            JSONObject data = teamOne.getJSONObject(i);

            String homeTeam = data.getString("match_hometeam_name");
            String awayTeam = data.getString("match_awayteam_name");
            String homeTeamScore = data.getString("match_hometeam_score");
            String awayTeamScore = data.getString("match_awayteam_score");

            match.setMatchDate(formatDate(data.getString("match_date")));
            match.setHomeTeam(homeTeam);
            match.setAwayTeam(awayTeam);
            match.setHomeTeamScore(homeTeamScore);
            match.setAwayTeamScore(awayTeamScore);
            match.setGameStatus(checkGameStatus(homeTeam, awayTeam, homeTeamScore, awayTeamScore, currentTeamName));
            matches.add(match);
        }
        return matches;
    }
    
    public List<Match> deserializeTeamTwoEntity(String jsonString, String currentTeamName) {
        int length;
        List<Match> matches = new ArrayList<>();
        JSONObject root = new JSONObject(jsonString);
        JSONArray teamTwo = root.getJSONArray("secondTeam_lastResults");
        if(teamTwo.length() > 5)
            length = 5;
        else
            length = teamTwo.length();
        
        for (int i = 0; i < length; i++) {
            Match match = new Match();
            JSONObject data = teamTwo.getJSONObject(i);

            String homeTeam = data.getString("match_hometeam_name");
            String awayTeam = data.getString("match_awayteam_name");
            String homeTeamScore = data.getString("match_hometeam_score");
            String awayTeamScore = data.getString("match_awayteam_score");

            match.setMatchDate(formatDate(data.getString("match_date")));
            match.setHomeTeam(homeTeam);
            match.setAwayTeam(awayTeam);
            match.setHomeTeamScore(homeTeamScore);
            match.setAwayTeamScore(awayTeamScore);
            match.setGameStatus(checkGameStatus(homeTeam, awayTeam, homeTeamScore, awayTeamScore, currentTeamName));
            matches.add(match);
        }
        return matches;
    }

    public List<Match> deserializeHeadToHeadEntity(String jsonString){
         int length;
        List<Match> matches = new ArrayList<>();
        JSONObject root = new JSONObject(jsonString);
        JSONArray teamTwo = root.getJSONArray("firstTeam_VS_secondTeam");
        if(teamTwo.length() > 5)
            length = 5;
        else
            length = teamTwo.length();
        
        for (int i = 0; i < length; i++) {
            Match match = new Match();
            JSONObject data = teamTwo.getJSONObject(i);

            String homeTeam = data.getString("match_hometeam_name");
            String awayTeam = data.getString("match_awayteam_name");
            String homeTeamScore = data.getString("match_hometeam_score");
            String awayTeamScore = data.getString("match_awayteam_score");

            match.setMatchDate(formatDate(data.getString("match_date")));
            match.setHomeTeam(homeTeam);
            match.setAwayTeam(awayTeam);
            match.setHomeTeamScore(homeTeamScore);
            match.setAwayTeamScore(awayTeamScore);
            matches.add(match);
        }
        return matches;
    }
    
    private char checkGameStatus(String homeTeam, String awayTeam, String teamOneScore, String teamTwoScore, String currentTeamName) {
        int homeTeamScore = Integer.parseInt(teamOneScore);
        int awayTeamScore = Integer.parseInt(teamTwoScore);
        char status = ' ';
        if (homeTeam.equalsIgnoreCase(currentTeamName)) {
            if (homeTeamScore > awayTeamScore) {
                status = 'W';
            } else if (homeTeamScore < awayTeamScore) {
                status = 'L';
            } else {
                status = 'D';
            }
        } else if (awayTeam.equalsIgnoreCase(currentTeamName)) {
            if (awayTeamScore > homeTeamScore) {
                status = 'W';
            } else if (awayTeamScore < homeTeamScore) {
                status = 'L';
            } else {
                status = 'D';
            }
        }
        return status;
    }

    private List<Lineup> getHomeTeamLineups(JSONObject data) {
        List<Lineup> lineups = new ArrayList<>();
        JSONObject lineup = data.getJSONObject("lineup");
        JSONObject home = lineup.getJSONObject("home");
        JSONArray startingLineup = home.getJSONArray("starting_lineups");
        for (int i = 0; i < startingLineup.length(); i++) {
            Lineup homeLineup = new Lineup();
            JSONObject l = startingLineup.getJSONObject(i);
            homeLineup.setLineupNumber(l.getString("lineup_number"));
            homeLineup.setLineupPlayer(l.getString("lineup_player"));
            homeLineup.setLineupPosition(l.getString("lineup_position"));
            lineups.add(homeLineup);
        }
        return lineups;
    }

    private List<Lineup> getAwayTeamLineups(JSONObject data) {
        List<Lineup> lineups = new ArrayList<>();
        JSONObject lineup = data.getJSONObject("lineup");
        JSONObject away = lineup.getJSONObject("away");
        JSONArray startingLineup = away.getJSONArray("starting_lineups");
        for (int i = 0; i < startingLineup.length(); i++) {
            Lineup awayLineup = new Lineup();
            JSONObject l = startingLineup.getJSONObject(i);
            awayLineup.setLineupNumber(l.getString("lineup_number"));
            awayLineup.setLineupPlayer(l.getString("lineup_player"));
            awayLineup.setLineupPosition(l.getString("lineup_position"));
            lineups.add(awayLineup);
        }
        return lineups;
    }

    private List<Statistics> getStatistics(JSONObject data) {
        List<Statistics> statistics = new ArrayList<>();
        JSONArray stats = data.getJSONArray("statistics");
        for (int i = 0; i < stats.length(); i++) {
            Statistics s = new Statistics();
            JSONObject ss = stats.getJSONObject(i);
            s.setAway(ss.getString("away"));
            s.setHome(ss.getString("home"));
            s.setType(ss.getString("type"));
            statistics.add(s);
        }
        return statistics;
    }

    private List<Goalscorer> getGoalScorers(JSONObject data) {
        List<Goalscorer> goalScorers = new ArrayList<>();
        JSONArray scorer = data.getJSONArray("goalscorer");
        for (int i = 0; i < scorer.length(); i++) {
            Goalscorer scorers = new Goalscorer();
            JSONObject gs = scorer.getJSONObject(i);
            scorers.setTime(gs.getString("time"));
            scorers.setHomeScorer(gs.getString("home_scorer"));
            scorers.setAwayScorer(gs.getString("away_scorer"));
            goalScorers.add(scorers);
        }
        return goalScorers;
    }

    private String formatDate(String date) {

        try {
            Date d = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            SimpleDateFormat sdf = new SimpleDateFormat("MMM dd");
            return sdf.format(d);
        } catch (ParseException ex) {
            System.err.println(ex.getMessage());
        }
        return null;
    }

}
