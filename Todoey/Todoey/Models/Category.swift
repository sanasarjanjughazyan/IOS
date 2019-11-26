//
//  Category.swift
//  Todoey
//
//  Created by Sanasar Janjughazyan on 11/25/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    @objc dynamic var color = ""
    let items = List<Item>()
}
