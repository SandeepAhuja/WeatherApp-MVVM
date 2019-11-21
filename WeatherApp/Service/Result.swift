//
//  Result.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 18/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
