//
//  WeatherBody.swift
//  Weather_App
//
//  Created by 신지원 on 12/12/23.
//

import Foundation

struct Weathers: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    let timezone : Int
    
    init(weather: [Weather] = [Weather()],
         main: Main = Main(),
         wind: Wind = Wind(),
         name: String = "",
         timezone: Int = 0) {
        self.weather = weather
        self.main = main
        self.wind = wind
        self.name = name
        self.timezone = timezone
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    init(id: Int = 0,
         main: String = "",
         description: String = "",
         icon: String = "") {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
    
    init(temp: Double = 0.0,
         temp_min: Double = 0.0,
         temp_max: Double = 0.0,
         humidity: Int = 0) {
        self.temp = temp
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.humidity = humidity
    }
}

struct Wind: Codable {
    let speed: Double
    
    init(speed: Double = 0.0) {
        self.speed = speed
    }
}


