//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 16/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import Foundation
import Combine

class WeatherForecastViewModel: ObservableObject {
    @Published private (set) var forecasts = [String : [ForecastViewModel]]()//1
    @Published var error: APIError?//2
    private var weather: WeatherForecast?
    {
        didSet
        {
            prepareDerivedResponse()
        }
    }
    private (set) var days = [String]()
    private let apiClient: WeatherClient
    
    init(client: WeatherClient) {
        self.apiClient = client
    }
    
    func getWeatherData()
    {
        apiClient.getWeatherFeed(from: .forecast) {[weak self] (result) in
            switch result {
            case .success(let forecast):
                if let unwrappedForecast = forecast {
                    self?.weather = unwrappedForecast
                }
            case .failure(let error):
                self?.error = error
            }
        }
    }
    
    private func prepareDerivedResponse()
    {
        let result = self.weather?.list.map({ (forecast) -> ForecastViewModel in
            return ForecastViewModel(forecast: forecast)
        })
        guard let unwrappedResult = result, !unwrappedResult.isEmpty else
        {
            self.error = APIError.empty
            return;
        }
        var derivedResponse = [String : [ForecastViewModel]]()
        for forecast in unwrappedResult {
            if let key = forecast.date {
                if derivedResponse[key] != nil {
                    derivedResponse[key]?.append(forecast)
                }else {
                    self.days.append(key)
                    derivedResponse[key] = [forecast]
                }
            }
        }
        self.forecasts = derivedResponse
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
