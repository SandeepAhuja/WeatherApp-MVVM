//
//  WeatherForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 17/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ForecastTableViewCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var forecasts: [ForecastViewModel]! {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.registerCell()
    }
    
    private func registerCell() {
        // Register the collection view cells.
        let weatherForecastCellNib = UINib(nibName: "WeatherForecastCollectionViewCell", bundle: nil)
        collectionView.register(weatherForecastCellNib, forCellWithReuseIdentifier: WeatherForecastCollectionViewCell.reuseIdentifier)
        
    }

    func configureCell(day: String, forecasts: [ForecastViewModel]) {
        self.dateLabel.text = day
        self.forecasts = forecasts
    }
        
}

extension WeatherForecastTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherForecastCollectionViewCell.reuseIdentifier, for: indexPath) as! WeatherForecastCollectionViewCell
        let forecast = self.forecasts[indexPath.row]
        cell.configureCell(forecast: forecast)
        return cell
    }
    
}
