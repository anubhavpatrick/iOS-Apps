//
//  FoodPinTableViewController.swift
//  FoodPinTableViewExcercise
//
//  Created by Anubhav Patrick on 16/07/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import UIKit

class FoodPinTableViewController: UITableViewController {

    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak"]
    
    let restaurantImage = [#imageLiteral(resourceName: "barrafina"),#imageLiteral(resourceName: "bourkestreetbakery"), #imageLiteral(resourceName: "cafedeadend"),#imageLiteral(resourceName: "cafeloisl"),#imageLiteral(resourceName: "cafelore"),#imageLiteral(resourceName: "caskpubkitchen"),#imageLiteral(resourceName: "confessional"),#imageLiteral(resourceName: "donostia"),#imageLiteral(resourceName: "fiveleaves"),#imageLiteral(resourceName: "forkeerestaurant"),#imageLiteral(resourceName: "grahamavenuemeats"),#imageLiteral(resourceName: "haighschocolate"),#imageLiteral(resourceName: "homei"),#imageLiteral(resourceName: "palominoespresso"),#imageLiteral(resourceName: "petiteoyster"),#imageLiteral(resourceName: "posatelier"),#imageLiteral(resourceName: "royaloak"),#imageLiteral(resourceName: "teakha"),#imageLiteral(resourceName: "traif"), #imageLiteral(resourceName: "upstate")]
    
    let restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
                               "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",
                               "London", "London", "London", "London"]
    
    let restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian /Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee", "Latin Amweican","Spanish","Spanish","Spanish","Indian"]
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodPinTableViewCell
        cell.restImageView?.image=restaurantImage[indexPath.row]
        cell.nameLabel?.text=restaurantNames[indexPath.row]
        cell.locationLabel?.text=restaurantLocations[indexPath.row]
        cell.typeLabel?.text=restaurantTypes[indexPath.row]

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert=UIAlertController(title: "What do you want to do??", message: nil, preferredStyle: .actionSheet)
        let callActionHandler={(action:UIAlertAction!)->Void in
            let alertMessage=UIAlertController(title:"Service Unavailable",message:"Sorry Call feature is not available yet. Please try again later!",preferredStyle:.alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true,completion: nil)
        }
        
        let callAction=UIAlertAction(title: "Call 123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        alert.addAction(callAction)
        let checkInAction=UIAlertAction(title: "Check In", style: .default) { (action:UIAlertAction)->Void in
            
            let currentCell=tableView.cellForRow(at: indexPath)
            if currentCell?.accessoryType != .checkmark {
                currentCell?.accessoryType = .checkmark
                tableView.deselectRow(at: indexPath, animated: false)}
            else
            {
                currentCell?.accessoryType = .none
                tableView.deselectRow(at: indexPath, animated: false)
            }
            
        }
        alert.addAction(checkInAction)
        let cancelOption=UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
        alert.addAction(cancelOption)
        present(alert, animated: true, completion: nil)
    }

}
