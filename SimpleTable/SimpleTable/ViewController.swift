//
//  ViewController.swift
//  SimpleTable
//
//  Created by Anubhav Patrick on 09/06/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    
    var restaurantNames=["CCD","Barista", "MacD", "BBQ", "PizzaHut", "Dominoes","Haldiram", "BikanerWala",
    "Rajdhani","MarwadhiBojh","Rajmahal","Sai","Flavors", "kfc", "Yours Pizza","Howdi","WatsUp","WhereAreYou","whwem",
    "Titanic","Poseidon","JSON", "Ant Script"]
    
    var imageName=["barrafina", "bourkestreetbakery","cafedeadend","cafeloisl","cafelore","restaurant"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell=tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath)
        
        //configure the cell
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image=UIImage(named: imageName[(indexPath.row)%6])
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }

}

