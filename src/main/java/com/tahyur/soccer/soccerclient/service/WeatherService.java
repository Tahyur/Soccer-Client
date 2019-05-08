/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tahyur.soccer.soccerclient.service;

import com.tahyur.soccer.soccerclient.deserialize.Deserialize;
import com.tahyur.soccer.soccerclient.model.Weather;
import com.tahyur.soccer.soccerclient.service.intfc.IWeatherService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author tayor
 */
@Service
public class WeatherService implements IWeatherService {

    private final String URL_ENDPOINT = "http://localhost:8080/weather";

    @Override
    public Weather getCurrentWeather() {
        Weather weather = null;
        RestTemplate template = new RestTemplate();
        String data = template.getForObject(URL_ENDPOINT, String.class);

        if (!data.isEmpty()) {
            Deserialize deserialize = new Deserialize();
            weather = deserialize.deserialializeWeatherEntity(data);
        } else {
            return null;
        }
        return weather;
    }

}
