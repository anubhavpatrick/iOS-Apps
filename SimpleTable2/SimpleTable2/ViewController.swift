//
//  ViewController.swift
//  SimpleTable2
//
//  Created by Anubhav Patrick on 12/07/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import UIKit //framework

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var collegeName=["KIET","ABES","AKGEC","JSS","IMS","Galgotia","MIET","PSIT","ABESIT","Hindustan",
                     "IFTM","TMU","AMITY","JUIT","JIIT","IPEC","KEC","JUET"]
    var imageName=[#imageLiteral(resourceName: "barrafina"), #imageLiteral(resourceName: "bourkestreetbakery"), #imageLiteral(resourceName: "cafedeadend"),#imageLiteral(resourceName: "cafeloisl"),#imageLiteral(resourceName: "cafelore"),#imageLiteral(resourceName: "caskpubkitchen"),#imageLiteral(resourceName: "confessional"),#imageLiteral(resourceName: "donostia"),#imageLiteral(resourceName: "fiveleaves"),#imageLiteral(resourceName: "forkeerestaurant"),#imageLiteral(resourceName: "grahamavenuemeats"),#imageLiteral(resourceName: "haighschocolate"),#imageLiteral(resourceName: "homei"),#imageLiteral(resourceName: "palominoespresso"),#imageLiteral(resourceName: "petiteoyster"),#imageLiteral(resourceName: "posatelier"),#imageLiteral(resourceName: "royaloak"),#imageLiteral(resourceName: "teakha"),#imageLiteral(resourceName: "traif"), #imageLiteral(resourceName: "upstate")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        singleCell.imageView?.image = imageName[indexPath.row]
        singleCell.textLabel?.text=collegeName[indexPath.row]
        
        
        return singleCell
        //<#code#>
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

