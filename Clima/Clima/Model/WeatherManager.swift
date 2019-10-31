//
//  WeatherManager.swift
//  Clima
//
//  Created by Sanasar Janjughazyan on 10/26/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=a53f5136a0e44e266701824edb7e95ea"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let finalURL = "\(weatherURL)&q=\(cityName)"
        performRequest(with: finalURL)
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        let finalURL = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: finalURL)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, urlResponce, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ wheatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: wheatherData)
            let id = decodedData.weather[0].id
            let city = decodedData.name
            let temperature = decodedData.main.temp
            return WeatherModel(cityName: city, id: id, temperature: temperature)
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
