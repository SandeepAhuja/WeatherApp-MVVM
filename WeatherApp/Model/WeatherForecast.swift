//
//  Weather.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 16/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

struct WeatherForecast: Decodable {
    let list: [Forecast]
}

struct Forecast: Decodable {
    let main: Main
    let dt: Double    
}

struct Main: Decodable {
    let temp: Double
}
