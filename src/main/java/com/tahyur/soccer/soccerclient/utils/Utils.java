/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.utils;

import com.tahyur.soccer.soccerclient.model.Weather;
import com.tahyur.soccer.soccerclient.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author tayor
 */
@Component
public class Utils {
    
    @Autowired
    WeatherService weatherService;
    
    public Weather getWeather(){
         Weather weather = weatherService.getCurrentWeather();
        if(weather != null)
            return weather;
        return null;
    }
}
