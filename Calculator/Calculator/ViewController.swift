//
//  ViewController.swift
//  Calculator
//
//  Created by Anubhav Patrick on 12/06/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var userIsTypingDigit=false
    @IBOutlet weak var calcDisplay: UILabel!
    
    @IBAction func num(_ sender: UIButton) {
        let digit=(sender.currentTitle!)
        if userIsTypingDigit
        {
            if digitCount(calcDisplay.text!) <= 10
            {
            calcDisplay.text!+=digit
            }
        }
        else{
        
            calcDisplay.text=digit
            userIsTypingDigit=true
        }
    }
    var displayValue: Double{
        get{
            return Double(calcDisplay.text!)!
        }
        set{
            calcDisplay.text=String(newValue)
        }
    }
    
    
    private var brain = CalcBrain()
 
    @IBAction func performOperation(_ sender: UIButton) {
       
        if userIsTypingDigit{
            userIsTypingDigit=false
            brain.setOperand(displayValue)
        }
        if let mathematicalSymbol=sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        if let result=brain.result{
            displayValue=result
        }
        
    }
    func digitCount(_ numberString:String) -> Int {
        var number = Int(numberString)!
        var digitCount=0
        while(number != 0)
        {
            digitCount+=1
            number/=10
        }
        return digitCount
        
    }
    @IBAction func okbutton(_ sender: Any) {
        print("meri beti")
    }
}

