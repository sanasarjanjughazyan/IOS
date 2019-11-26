//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Sanasar Janjughazyan on 11/25/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
    }
    
    func updateModel(at indexPath: IndexPath) {
        // update out Model
    }
    
    func updateBar(withHexCode hexColor: String) {
        guard let navBar = navigationController?.navigationBar else {
            fatalError("Navigateion Bar doesn't exists")
        }
        guard let color = UIColor(hexString: hexColor) else {fatalError()}
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance().self
                            
            appearance.backgroundColor = color
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.init(contrastingBlackOrWhiteColorOn: color, isFlat: true)!]
         
            navBar.standardAppearance = appearance
            navBar.compactAppearance = appearance
            navBar.scrollEdgeAppearance = appearance
            navBar.tintColor = UIColor.init(contrastingBlackOrWhiteColorOn: color, isFlat: true)
                            
        } else {
            navBar.barTintColor = color
            navBar.tintColor = UIColor.init(contrastingBlackOrWhiteColorOn: color, isFlat: true)
            navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(contrastingBlackOrWhiteColorOn: color, isFlat: true)!]
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    //MARK: - SwipeTableViewCellDelegate Delegate Methods
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.updateModel(at: indexPath)
        }
        deleteAction.image = UIImage(named: "delete-icon")
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
}
