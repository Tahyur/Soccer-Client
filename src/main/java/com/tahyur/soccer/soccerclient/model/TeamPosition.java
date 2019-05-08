/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.model;

/**
 *
 * @author tayor
 */
public class TeamPosition extends Soccer implements Comparable<TeamPosition> {
     private String teamName;
    private Integer leaguePosition;
    private String gamesPlayed;
    private String gamesWon;
    private String gamesDrawn;
    private String gamesLost;
    private String goalsFor;
    private String goalsAgainst;
    private String goalDifference;
    private String totalPoints;

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public Integer getLeaguePosition() {
        return leaguePosition;
    }

    public void setLeaguePosition(Integer leaguePosition) {
        this.leaguePosition = leaguePosition;
    }

    public String getGamesPlayed() {
        return gamesPlayed;
    }

    public void setGamesPlayed(String gamesPlayed) {
        this.gamesPlayed = gamesPlayed;
    }

    public String getGamesWon() {
        return gamesWon;
    }

    public void setGamesWon(String gamesWon) {
        this.gamesWon = gamesWon;
    }

    public String getGamesDrawn() {
        return gamesDrawn;
    }

    public void setGamesDrawn(String gamesDrawn) {
        this.gamesDrawn = gamesDrawn;
    }

    public String getGamesLost() {
        return gamesLost;
    }

    public void setGamesLost(String gamesLost) {
        this.gamesLost = gamesLost;
    }

    public String getGoalsFor() {
        return goalsFor;
    }

    public void setGoalsFor(String goalsFor) {
        this.goalsFor = goalsFor;
    }

    public String getGoalsAgainst() {
        return goalsAgainst;
    }

    public void setGoalsAgainst(String goalsAgainst) {
        this.goalsAgainst = goalsAgainst;
    }

    public String getGoalDifference() {
        return goalDifference;
    }

    public void setGoalDifference(String goalDifference) {
        this.goalDifference = goalDifference;
    }

    public String getTotalPoints() {
        return totalPoints;
    }

    public void setTotalPoints(String totalPoints) {
        this.totalPoints = totalPoints;
    }

    @Override
    public int compareTo(TeamPosition o) {
        return this.getLeaguePosition().compareTo(o.getLeaguePosition());
    }
}
