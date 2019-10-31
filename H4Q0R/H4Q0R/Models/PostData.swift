//
//  PostData.swift
//  H4Q0R
//
//  Created by Sanasar Janjughazyan on 10/31/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import Foundation

struct PostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let points: Int
    let url: String?
    let title: String
    
    var id: String {
        return objectID
    }
}
