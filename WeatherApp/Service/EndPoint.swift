//
//  EndPoint.swift
//  WeatherApp
//
//  Created by Sandeep Ahuja on 18/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var query: String { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = query
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
