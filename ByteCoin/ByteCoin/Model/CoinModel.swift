//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Sanasar Janjughazyan on 10/27/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let bitcoin: Double
    let currency: String
    
    var bitcoinString: String {
        String(format: "%.2f", bitcoin)
    }
}
