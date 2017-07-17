//
//  calcBrain.swift
//  Calculator
//
//  Created by Anubhav Patrick on 24/06/17.
//  Copyright © 2017 Anubhav Patrick. All rights reserved.
//

import Foundation


struct CalcBrain {
    private var accumulator:Double? //Will store intermediate values
    
    
    enum Operation {
        case constant(Double)
        case unaryOperation((Double)->Double)
        case binaryOperation((Double,Double)->Double)
        case equals
    }
    private var operations:[String:Operation] = [  //Dictionary
        "π": .constant(Double.pi),
        "e": .constant(M_E),
        "CLE": .constant(0),
        "√": .unaryOperation(sqrt),
        "cos": .unaryOperation(cos),
        "±": .unaryOperation( {-$0} ),// closure
        "×": .binaryOperation({$0 * $1}),  // closure
        "+": .binaryOperation( {$0 + $1}),  // closure
        "-": .binaryOperation( {$0 - $1}),  // closure
        "÷": .binaryOperation( {$0 / $1}),  // closure
        "=": .equals
    ]
    mutating func performOperation(_ symbol:String) { // this func will be using 'operations' dictionary
        if let constant = operations[symbol]{
            switch constant {
            case .constant(let constValue):
                accumulator=constValue
            case .unaryOperation(let f):
                accumulator=f(accumulator!)
            case .binaryOperation(let f):
                if accumulator != nil && pendingBinaryOperation == nil
                {
                    pendingBinaryOperation=PendingBinaryOperation(function: f,firstOperand: accumulator!)
                    accumulator=nil
                    
                }
            case .equals:
                performBinaryOperation()
                
            }
        }
        
    }
    private mutating func performBinaryOperation()
    {
        accumulator=pendingBinaryOperation?.perform(with: accumulator!)
        pendingBinaryOperation=nil
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation { //This function will hold the first operand and the operation that needs to be performed then it will perform the required operation using the second operand
        var function: (Double,Double)-> Double//The operation that need to be performed
        var firstOperand: Double
        func perform(with secondOperand:Double)->Double{
            return function(firstOperand,secondOperand)
        }
    }
    mutating func setOperand(_ operand: Double) {
        accumulator=operand
    }
    var result:Double?{ //Computed Property
        get{
            return accumulator
        }
    }
}
