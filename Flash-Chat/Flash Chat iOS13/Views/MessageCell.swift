//
//  MessegeCell.swift
//  Flash Chat iOS13
//
//  Created by Sanasar Janjughazyan on 11/14/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messegeBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rigthImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messegeBubble.layer.cornerRadius = messegeBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
