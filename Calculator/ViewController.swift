//
//  ViewController.swift
//  Calculator
//
//  Created by THECAT on 30.06.17.
//  Copyright © 2017 THECAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddelOfTyping = false
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddelOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else {
            display.text = digit
            userIsInTheMiddelOfTyping = true
        }
        
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set{
            
            if newValue == Double(Int(newValue)) {display.text = String(Int(newValue))
            }else{display.text = String(newValue)}

        }
    }
    /*the model is private to the controller
    /* initializin by creation of a calculator brain */
     */
    private var brain = CalculatorBrain()
    
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsInTheMiddelOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddelOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            
            brain.performOperation(mathematicalSymbol)
            
        }
        if let result = brain.result{
            displayValue = result
            
            
        }
        
    }
    @IBAction func clear(_ sender: UIButton) {
        
        brain = CalculatorBrain()
        displayValue = 0
        display.text?.removeAll()
        display.text = nil ?? "0"
        userIsInTheMiddelOfTyping = false
    }
    
    
}

