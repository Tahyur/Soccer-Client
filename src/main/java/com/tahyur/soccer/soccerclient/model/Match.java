/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.model;

import java.util.List;

/**
 *
 * @author tayor
 */
public class Match extends Soccer {

    private String from;
    private String to;
    private String matchStatus;
    private String matchDate;
    private String matchTime;
    private String homeTeam;
    private String awayTeam;
    private String homeFormation;
    private String awayFormation;
    private String homeTeamScore;
    private String awayTeamScore;
    private String homeHalfTimeScore;
    private String awayHalfTimeScore;
    private char gameStatus;
    private List<Goalscorer> goalScorers;
    private List<Lineup> homeTeamLineup;
    private List<Lineup> awayTeamLineup;
    private List<Statistics> statistics;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(String matchDate) {
        this.matchDate = matchDate;
    }

    public String getMatchTime() {
        return matchTime;
    }

    public void setMatchTime(String matchTime) {
        this.matchTime = matchTime;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(String homeTeam) {
        this.homeTeam = homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(String awayTeam) {
        this.awayTeam = awayTeam;
    }

    public String getHomeTeamScore() {
        return homeTeamScore;
    }

    public void setHomeTeamScore(String homeTeamScore) {
        this.homeTeamScore = homeTeamScore;
    }

    public String getAwayTeamScore() {
        return awayTeamScore;
    }

    public void setAwayTeamScore(String awayTeamScore) {
        this.awayTeamScore = awayTeamScore;
    }

    public List<Lineup> getHomeTeamLineup() {
        return homeTeamLineup;
    }

    public void setHomeTeamLineup(List<Lineup> homeTeamLineup) {
        this.homeTeamLineup = homeTeamLineup;
    }

    public List<Lineup> getAwayTeamLineup() {
        return awayTeamLineup;
    }

    public void setAwayTeamLineup(List<Lineup> awayTeamLineup) {
        this.awayTeamLineup = awayTeamLineup;
    }

    public List<Statistics> getStatistics() {
        return statistics;
    }

    public void setStatistics(List<Statistics> statistics) {
        this.statistics = statistics;
    }

    public String getHomeFormation() {
        return homeFormation;
    }

    public void setHomeFormation(String homeFormation) {
        this.homeFormation = homeFormation;
    }

    public String getAwayFormation() {
        return awayFormation;
    }

    public void setAwayFormation(String awayFormation) {
        this.awayFormation = awayFormation;
    }

    public String getMatchStatus() {
        return matchStatus;
    }

    public void setMatchStatus(String matchStatus) {
        this.matchStatus = matchStatus;
    }

    public String getHomeHalfTimeScore() {
        return homeHalfTimeScore;
    }

    public void setHomeHalfTimeScore(String homeHalfTimeScore) {
        this.homeHalfTimeScore = homeHalfTimeScore;
    }

    public String getAwayHalfTimeScore() {
        return awayHalfTimeScore;
    }

    public void setAwayHalfTimeScore(String awayHalfTimeScore) {
        this.awayHalfTimeScore = awayHalfTimeScore;
    }

    public List<Goalscorer> getGoalScorers() {
        return goalScorers;
    }

    public void setGoalScorers(List<Goalscorer> goalScorers) {
        this.goalScorers = goalScorers;
    }

    public char getGameStatus() {
        return gameStatus;
    }

    public void setGameStatus(char gameStatus) {
        this.gameStatus = gameStatus;
    }

    
}
