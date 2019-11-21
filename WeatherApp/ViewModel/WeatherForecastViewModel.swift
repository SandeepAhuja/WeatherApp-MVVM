//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 16/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import Foundation

struct WeatherForecastViewModel {
    
    private let weather: WeatherForecast
    private (set) var forecasts = [String : [ForecastViewModel]]()
    private (set) var days = [String]()
    
    init(weather: WeatherForecast) {
        self.weather = weather
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        let result = weather.list.map({ (forecast) -> ForecastViewModel in
            return ForecastViewModel(forecast: forecast)
        })
        
        for forecast in result {
            if let key = forecast.date {
                if self.forecasts[key] != nil {
                    self.forecasts[key]?.append(forecast)
                }else {
                    self.days.append(key)
                    self.forecasts[key] = [forecast]
                }
            }
        }
    }
}

struct ForecastViewModel {
    private let forecast: Forecast
    private (set) var temperature: String?
    private (set) var dateForeCast: Date?
    private (set) var time: String?
    private (set) var date: String?
    init(forecast: Forecast) {
        self.forecast = forecast
        self.updateProperties()
    }
    
    private mutating func updateProperties() {
        self.temperature = "\(forecast.main.temp) °C"
        self.dateForeCast = Date.init(timeIntervalSince1970: forecast.dt)
        self.time = self.dateForeCast?.formattedStringWithStyle(timeStyle: .short, dateStyle: .none)
        self.date = self.dateForeCast?.formattedStringWithStyle(timeStyle: .none, dateStyle: .long)
    }
}
