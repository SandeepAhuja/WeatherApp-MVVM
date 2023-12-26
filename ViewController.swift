//
//  ViewController.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 16/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var forecastTableView: UITableView!
    private var cancellables: Set<AnyCancellable> = []
    private var weatherForeCast: WeatherForecastViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forecastCell = UINib(nibName: "WeatherForecastTableViewCell", bundle: nil)
        forecastTableView.register(forecastCell, forCellReuseIdentifier: WeatherForecastTableViewCell.reuseIdentifier)
        self.weatherForeCast = WeatherForecastViewModel(client: WeatherClient())
        self.weatherForeCast?.$forecasts.sink(receiveValue: {[weak self] _ in
            self?.forecastTableView.reloadData()
        }).store(in: &cancellables)
        
        self.weatherForeCast?.getWeatherData()
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
