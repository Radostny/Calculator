//
//  ViewController.swift
//  Calculator
//
//  Created by Andrey Radostny on 13.04.15.
//  Copyright (c) 2015 Andrey Radostny. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
            println("digit = \(digit)")
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }

    }
    @IBAction func appendDot() {
        if display.text!.rangeOfString(".") == nil {
            display.text = display.text! + "."
        }
        
    }
    
    @IBAction func operatePi() {
        // test git stuff
        
    }
    
    @IBAction func operate(sender: UIButton) {
        
        if userIsInTheMiddleOfTypingNumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }

    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0 // Actually, it equals to nil or Error, not 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
        }
    }
}

