//
//  ViewController.swift
//  autoLayoutPractice
//
//  Created by Anubhav Patrick on 02/06/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
    
        if sender.title(for: .normal) == "Ahoooooo!!!!!!!!!"
        {
            sender.setTitle("Y", for: .normal)
        }
        else{
            sender.setTitle("Ahoooooo!!!!!!!!!", for: .normal)
        }
        
    }


}

