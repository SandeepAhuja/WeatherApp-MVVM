//
//  ViewController.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 16/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forecastTableView: UITableView!
    
    private var weatherForeCast: WeatherForecastViewModel? {
        didSet {
            forecastTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forecastCell = UINib(nibName: "WeatherForecastTableViewCell", bundle: nil)
        forecastTableView.register(forecastCell, forCellReuseIdentifier: WeatherForecastTableViewCell.reuseIdentifier)
        
        self.weather()
    }
    
    private func weather() {
        WeatherClient().getWeatherFeed(from: .forecast) {[weak self] (result) in
            switch result {
            case .success(let forecast):
                if let unwrappedForecast = forecast {
                    self?.weatherForeCast = WeatherForecastViewModel(weather: unwrappedForecast)
                }
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherForeCast?.days.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherForecastTableViewCell.reuseIdentifier, for: indexPath) as! WeatherForecastTableViewCell
        if let day = self.weatherForeCast?.days[indexPath.row], let forecasts = self.weatherForeCast?.forecasts[day] {
            cell.configureCell(day: day, forecasts: forecasts)
        }
        return cell
    }
    
}
