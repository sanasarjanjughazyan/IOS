//
//  WeatherData.swift
//  Clima
//
//  Created by Sanasar Janjughazyan on 10/26/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
