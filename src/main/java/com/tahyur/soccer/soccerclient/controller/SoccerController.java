/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.controller;

import com.tahyur.soccer.soccerclient.model.Match;
import com.tahyur.soccer.soccerclient.model.Soccer;
import com.tahyur.soccer.soccerclient.model.Standing;
import com.tahyur.soccer.soccerclient.model.Team;
import com.tahyur.soccer.soccerclient.model.TeamPosition;
import com.tahyur.soccer.soccerclient.service.SoccerService;
import com.tahyur.soccer.soccerclient.utils.Utils;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author tayor
 */
@Controller
public class SoccerController {

    @Autowired
    SoccerService soccerService;

    @Autowired
    Utils utils;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("soccer", new Soccer());
        model.addAttribute("weather", utils.getWeather());
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index2(Model model) {
        model.addAttribute("soccer", new Soccer());
        model.addAttribute("weather", utils.getWeather());
        return "index";
    }

     @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model model) {
        model.addAttribute("soccer", new Soccer());
        if(utils.getWeather() != null){
        model.addAttribute("weather", utils.getWeather());
        }
        return "about";
    }
    
    @RequestMapping(value = "/results", method = RequestMethod.GET)
    public String displayResultPage(Model model) {
        model.addAttribute("matches", new Match());
        model.addAttribute("weather", utils.getWeather());
        return "result";
    }

    @RequestMapping(value = "/results", method = RequestMethod.POST)
    public String getMatchesResult(Model model, @Valid @ModelAttribute("matches") Match match) {
        model.addAttribute("weather", utils.getWeather());
        if (match.getLeagueId().isEmpty()) {
            model.addAttribute("error", "Select a league");
        } else if (match.getFrom().isEmpty()) {
            model.addAttribute("error", "Select a start range");
        } else if (match.getTo().isEmpty()) {
            model.addAttribute("error", "Select an end range");
        } else {
            List<Match> matches = soccerService.getMatchesResults(match.getLeagueId(), match.getFrom(), match.getTo());
            model.addAttribute("match", matches);
        }
        return "result";
    }

    @RequestMapping(value = "/standings", method = RequestMethod.GET)
    public String standings(Model model) {
        model.addAttribute("standings", new Standing());
        model.addAttribute("weather", utils.getWeather());
        return "standing";
    }

    @RequestMapping(value = "/standings", method = RequestMethod.POST)
    public String getLeagueStandings(Model model, @Valid @ModelAttribute("standings") TeamPosition teamPosition) {
        model.addAttribute("weather", utils.getWeather());
        if(!teamPosition.getLeagueId().isEmpty()){
        Standing standing = soccerService.getLeagueStandings(teamPosition.getLeagueId());
        model.addAttribute("standing", standing);
        } else{
            model.addAttribute("error", "Select a league");
        }
        return "standing";
    }

    @RequestMapping(value = "/headtohead", method = RequestMethod.GET)
    public String teams(Model model) {
        model.addAttribute("weather", utils.getWeather());
        model.addAttribute("headtohead", new TeamPosition());
        model.addAttribute("htoh", new Team());
        return "headtohead";
    }

    @RequestMapping(value = "/headtohead", method = RequestMethod.POST)
    public String getTeams(Model model, @ModelAttribute("headtohead") Team team) {
        model.addAttribute("weather", utils.getWeather());
        model.addAttribute("selected", "selected");
        model.addAttribute("htoh", new Team());
        if (team != null) {
            List<Team> teams = soccerService.getTeams(team.getLeagueId());
            model.addAttribute("teams", teams);
        } else {
            model.addAttribute("error", "Could not process, team not selected");
        }
        return "headtohead";
    }

    @RequestMapping("fetch")
    public @ResponseBody
    List<Team> selectTeam(@RequestParam("id") String id, Model model) {
        if (!id.isEmpty()) {
            List<Team> teams = soccerService.getTeams(id);
            return teams;
        }
        return null;
    }

    @RequestMapping("fetchTeamOneRecord")
    public @ResponseBody
    List<Match> getTeamOneRecord(@RequestParam("name") String name) {
        if (!name.isEmpty()) {
            List<Match> matches = soccerService.getTeamOneRecord(name);
            return matches;
        }
        return null;
    }

    @RequestMapping("fetchTeamTwoRecord")
    public @ResponseBody
    List<Match> getTeamTwoRecord(@RequestParam("name") String name) {
        if (!name.isEmpty()) {
            List<Match> matches = soccerService.getTeamTwoRecord(name);
            return matches;
        }
        return null;
    }

    @RequestMapping("fetchHeadToHead")
    public @ResponseBody
    List<Match> getHeadToHeadRecord(@RequestParam("teamOne") String teamOne, @RequestParam("teamTwo") String teamTwo, Model model) {
        List<Match> matches = soccerService.getHeadToHead(teamOne, teamTwo);
        if (matches != null) {
            model.addAttribute("match", matches);
            return matches;
        }
        return null;
    }
}
