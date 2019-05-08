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
public class Standing extends Soccer {
   private List<TeamPosition> standings;

    public List<TeamPosition> getStandings() {
        return standings;
    }

    public void setStandings(List<TeamPosition> standings) {
        this.standings = standings;
    }
   
}
