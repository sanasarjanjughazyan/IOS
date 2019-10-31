//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coinModel: CoinModel)
    func didFailedWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var selectedCurrency = ""
    var delegate: CoinManagerDelegate?
    
    mutating func getCoinPrice(for currency: String) {
        let finalURL = "\(baseURL)\(currency)"
        selectedCurrency = currency
        performRequest(finalURL)
    }
    
    func performRequest(_ url: String) {
        if let url = URL(string: url) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, urlResponse, error) in
                if (error != nil) {
                    self.delegate?.didFailedWithError(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let coinData = try decoder.decode(CoinData.self, from: data)
            let coinModel = CoinModel(bitcoin: coinData.last, currency: selectedCurrency)
            delegate?.didUpdateCurrency(coinModel)
        } catch {
            delegate?.didFailedWithError(error)
        }
    }
}
