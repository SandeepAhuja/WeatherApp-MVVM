//
//  Date+Additions.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 18/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import Foundation

extension Date {
    
    func formattedStringWithStyle(timeStyle: DateFormatter.Style, dateStyle: DateFormatter.Style)-> String {
        let formatter = DateFormatter()
        formatter.timeStyle = timeStyle
        formatter.dateStyle = dateStyle
        return formatter.string(from: self)
    }
    
}
