//
//  AppDelegate.swift
//  Todoey
//
//  Created by Sanasar Janjughazyan on 11/20/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            _ = try Realm()
        } catch {
            print("Error while initializing realm: \(error)")
        }
        
        return true
    }

}

