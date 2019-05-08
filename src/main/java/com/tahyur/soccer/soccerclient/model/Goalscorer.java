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
public class Goalscorer {

    public String time;
    public String homeScorer;
    public String awayScorer;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getHomeScorer() {
        return homeScorer;
    }

    public void setHomeScorer(String homeScorer) {
        this.homeScorer = homeScorer;
    }

    public String getAwayScorer() {
        return awayScorer;
    }

    public void setAwayScorer(String awayScorer) {
        this.awayScorer = awayScorer;
    }

}
