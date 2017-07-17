//
//  FoodPinTableViewCell.swift
//  FoodPinTableViewExcercise
//
//  Created by Anubhav Patrick on 16/07/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import UIKit

class FoodPinTableViewCell: UITableViewCell {
    
    @IBOutlet var restImageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var locationLabel: UILabel?
    @IBOutlet var typeLabel: UILabel?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
