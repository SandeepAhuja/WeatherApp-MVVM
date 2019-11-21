//
//  WeatherForecastTests.swift
//  WeatherAppTests
//
//  Created by Sandeep Ahuja on 18/11/19.
//  Copyright © 2019 Sandeep Ahuja. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherForecastTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoding_whenMissingType_itThrows() {
        XCTAssertThrowsError(try JSONDecoder().decode(WeatherForecast.self, from: weatherFeedWithMissingData)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("list", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but got \(error)")
            }
        }
        XCTAssertThrowsError(try JSONDecoder().decode(WeatherForecast.self, from: weatherFeedWithMissingData)) { (error) in
            
        }
    }
    
    func testDecoding_whenMissingAttributes_itThrows() {
        XCTAssertThrowsError(try JSONDecoder().decode(WeatherForecast.self, from: weatherFeedWithMissingAttribute)) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual("temp", key.stringValue)
            } else {
                XCTFail("Expected '.keyNotFound' but got \(error)")
            }
        }
    }
    
    func testDecoding_whenDataIsComplete_itThrowsNoting() {
        XCTAssertNoThrow(try JSONDecoder().decode(WeatherForecast.self, from: weatherFeed))
    }
    
    

    private let weatherFeedWithMissingData = Data("""
    {
      "cod": "200",
      "message": 0,
      "cnt": 40,
      "result": [
        {
          "dt": 1574078400,
          "main": {
            "temp": 11.52,
            "temp_min": 11.52,
            "temp_max": 15.64,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1006,
            "humidity": 46,
            "temp_kf": -4.13
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "clouds": {
            "all": 0
          },
          "wind": {
            "speed": 0.38,
            "deg": 62
          },
          "sys": {
            "pod": "n"
          },
          "dt_txt": "2019-11-18 12:00:00"
        }
      ],
      "city": {
        "name": "Mountain View",
        "coord": {
          "lat": 37.3855,
          "lon": -122.088
        },
        "country": "US",
        "timezone": -28800,
        "sunrise": 1574088656,
        "sunset": 1574124983
      }
    }
    """.utf8)

    private let weatherFeed = Data("""
    {
      "cod": "200",
      "message": 0,
      "cnt": 40,
      "list": [
        {
          "dt": 1574078400,
          "main": {
            "temp": 11.52,
            "temp_min": 11.52,
            "temp_max": 15.64,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1006,
            "humidity": 46,
            "temp_kf": -4.13
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "clouds": {
            "all": 0
          },
          "wind": {
            "speed": 0.38,
            "deg": 62
          },
          "sys": {
            "pod": "n"
          },
          "dt_txt": "2019-11-18 12:00:00"
        }
      ],
      "city": {
        "name": "Mountain View",
        "coord": {
          "lat": 37.3855,
          "lon": -122.088
        },
        "country": "US",
        "timezone": -28800,
        "sunrise": 1574088656,
        "sunset": 1574124983
      }
    }
    """.utf8)
    
    private let weatherFeedWithMissingAttribute = Data("""
    {
      "cod": "200",
      "message": 0,
      "cnt": 40,
      "list": [
        {
          "dt": 1574078400,
          "main": {
            "temperature": 11.52,
            "temp_min": 11.52,
            "temp_max": 15.64,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1006,
            "humidity": 46,
            "temp_kf": -4.13
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "clouds": {
            "all": 0
          },
          "wind": {
            "speed": 0.38,
            "deg": 62
          },
          "sys": {
            "pod": "n"
          },
          "dt_txt": "2019-11-18 12:00:00"
        }
      ],
      "city": {
        "name": "Mountain View",
        "coord": {
          "lat": 37.3855,
          "lon": -122.088
        },
        "country": "US",
        "timezone": -28800,
        "sunrise": 1574088656,
        "sunset": 1574124983
      }
    }
    """.utf8)
}
