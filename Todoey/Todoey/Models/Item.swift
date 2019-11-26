//
//  Item.swift
//  Todoey
//
//  Created by Sanasar Janjughazyan on 11/25/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated = Date()
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
