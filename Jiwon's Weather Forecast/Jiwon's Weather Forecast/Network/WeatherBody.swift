//
//  WeatherBody.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 11/17/23.
//

import Foundation

struct Weathers: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    let timezone : Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
}

struct Wind: Codable {
    let speed: Double
}

