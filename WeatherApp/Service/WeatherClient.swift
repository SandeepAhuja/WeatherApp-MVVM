//
//  WeatherAPIManager.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 16/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import UIKit

class WeatherClient: APIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getWeatherFeed(from weatherFeedType: WeatherFeed, completion: @escaping (Result<WeatherForecast?, APIError>) -> Void) {
        let endPoint = weatherFeedType
        let request = endPoint.request
        
        fetch(with: request, decode: { (json) -> WeatherForecast? in
            guard let weather = json as? WeatherForecast else {
                return nil
            }
            return weather
        }, completion: completion)
    }
}
