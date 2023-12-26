                                               Weather App
# Overview                                
                    
This sample code builds a weather app that displays a simple five-day weather forecast using a horizontally paging collection view. Each collection view cell contains a label showing the day the forecast applies to, a label describing temperature it. 

# Scope:

By considering the scope of this demo project. I have used Model-View-Controller pattern with solid principles and View-model. For that, we segregated the responsibility among various layers and their components to make this code more adaptive to change and testable. Assuming the team size and duration of discussed project, we can go with MVC+ViewModel with solid principles to deliver it within timelines and quality.

# Note: For a mid size and big-project, we can go for application of Clean architecture. 

## This sample project consists of three targets:

## 1. The main app — WeatherApp
## 2. Unit test - WeatherAppTests

# Layers
-----------------------------------------------------------------------------------------------------------------------------------------------------------

## Data Model

We are using Codable protocol to map JSON from weather API to model layer.  

## Source Code
struct WeatherForecast: Decodable {
    let list: [Forecast]
}

struct Forecast: Decodable {
    let main: Main
    let dt: Double    
}

struct Main: Decodable {
    let temp: Double
}

## Service Layer

### Generic API client
This layer contains Generic API client that uses Generics to return model objects after parsing

### Result.swift
This file contains the result type of API client, that returns success or failure at one time.

### EndPoint.swift
This protocol helps its conforming entity to build url request.

### APIError.swift
This class is collection of api errors thrown by api client.

### WeatherFeed.swift
This class creates the URL request for weather feed. Conforms to EndPoint.swift

## UI Layer
We have put UI elements in storyboard named "Main" and custom cell xibs.

## Resource
We have put app icons and images in Assets.xcassets file.

## Extensions
To maintain the single responsibility and open-closed principle, we added extension in project for Date functions.

### Date+Additions
We are not changing the existing functionality of date class, we added shared code in Date extension.

# WeatherAppTests
For demonstration purpose, I added a few unit tests for Model class in WeatherForecastTests.swift class
