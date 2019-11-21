//
//  WeatherFeed.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 18/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import Foundation

enum WeatherFeed {
    case forecast
}

extension WeatherFeed: Endpoint {
    
    var base: String {
        return "https://api.openweathermap.org"
    }
    
    var path: String {
        switch self {
        case .forecast: return "/data/2.5/forecast"
        }
    }
    
    var query: String {
        return "zip=94040&appid=7c3e6739088b418c055e3171590b8ffc&units=metric"
    }
    
}
