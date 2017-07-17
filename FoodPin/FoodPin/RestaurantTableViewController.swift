//
//  RestaurantTableViewControolerTableViewController.swift
//  FoodPin
//
//  Created by Anubhav Patrick on 14/07/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//


import UIKit //framework

class RestaurantTableViewController: UITableViewController {
  
    
    var isMarked=Array(repeating: false, count: 18)

    var collegeName=["KIET","ABES","AKGEC","JSS","IMS","Galgotia","MIET","PSIT","ABESIT","Hindustan","IFTM","TMU","AMITY","JUIT","JIIT","IPEC","KEC","JUET"]
    
    
    var restaurantImage = [#imageLiteral(resourceName: "barrafina"),#imageLiteral(resourceName: "bourkestreetbakery"), #imageLiteral(resourceName: "cafedeadend"),#imageLiteral(resourceName: "cafeloisl"),#imageLiteral(resourceName: "cafelore"),#imageLiteral(resourceName: "caskpubkitchen"),#imageLiteral(resourceName: "confessional"),#imageLiteral(resourceName: "donostia"),#imageLiteral(resourceName: "fiveleaves"),#imageLiteral(resourceName: "forkeerestaurant"),#imageLiteral(resourceName: "grahamavenuemeats"),#imageLiteral(resourceName: "haighschocolate"),#imageLiteral(resourceName: "homei"),#imageLiteral(resourceName: "palominoespresso"),#imageLiteral(resourceName: "petiteoyster"),#imageLiteral(resourceName: "posatelier"),#imageLiteral(resourceName: "royaloak"),#imageLiteral(resourceName: "teakha"),#imageLiteral(resourceName: "traif"), #imageLiteral(resourceName: "upstate")]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
                               "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York",
        "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian /Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee", "Latin Amweican","Spanish","Spanish","Spanish"]
    

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collegeName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell
        print(indexPath.row)
        if isMarked[indexPath.row]==false {
            
            cell.accessoryType = .none
        }
        else{
            cell.accessoryType = .checkmark
        }
        cell.nameLabel.text=collegeName[indexPath.row]
        cell.typeLabel.text=restaurantTypes[indexPath.row]
        cell.locationLabel.text=restaurantLocations[indexPath.row]
        
        cell.thumbnailImageView.image=restaurantImage[indexPath.row]
        cell.thumbnailImageView.layer.cornerRadius=30
        cell.thumbnailImageView.clipsToBounds=true
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            collegeName.remove(at: indexPath.row)
            restaurantImage.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            isMarked.remove(at: indexPath.row)
            tableView.reloadData()
        }
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
        
        if(isMarked[indexPath.row]==false)
        {
            let checkInAction=UIAlertAction(title: "Check In", style: .default) { (action:UIAlertAction)->Void in
                
                let currentCell=tableView.cellForRow(at: indexPath)
                
                currentCell?.accessoryType = .checkmark
                self.isMarked[indexPath.row]=true
                tableView.deselectRow(at: indexPath, animated: false)
                
            }
            alert.addAction(checkInAction)
        }
        else {
            let unCheckInAction=UIAlertAction(title: "Undo Check In", style: .default) { (action:UIAlertAction)->Void in
                
                let currentCell=tableView.cellForRow(at: indexPath)
                
                currentCell?.accessoryType = .none
                self.isMarked[indexPath.row]=false
                tableView.deselectRow(at: indexPath, animated: false)
                
            }
            alert.addAction(unCheckInAction)
        }
        let cancelOption=UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
        alert.addAction(cancelOption)
        present(alert, animated: true, completion: nil)
    }

   
}
