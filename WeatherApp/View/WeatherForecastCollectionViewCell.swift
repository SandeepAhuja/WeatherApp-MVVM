//
//  WeatherForecastCollectionViewCell.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 17/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import UIKit

class WeatherForecastCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ForecastCollectionViewCell"    
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: ForecastViewModel) {
        self.timeLabel.text = forecast.time
        self.tempLabel.text = forecast.temperature
    }

}
