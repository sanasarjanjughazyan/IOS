//
//  WheatherManagerDelegate.swift
//  Clima
//
//  Created by Sanasar Janjughazyan on 10/26/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ error: Error)
}
