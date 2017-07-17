//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Anubhav Patrick on 14/07/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

//CUSTOM CLASS TO CONTROL PROTOTYPE CELL

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
