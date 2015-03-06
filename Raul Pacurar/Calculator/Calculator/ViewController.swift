//
//  ViewController.swift
//  Calculator
//
//  Created by Raul Pacurar on 31/01/15.
//  Copyright (c) 2015 Raul Pacurar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CalculatorBrainDelegate {
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var consoleDisplay: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var brain = CalculatorBrain()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.delegate = self
    }
    
    //MARK: IBActions
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        appendNumber(digit)
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    @IBAction func dot(sender: UIButton) {
        let dot = sender.currentTitle!
        if display.text?.rangeOfString(dot) == nil {
            appendDigit(sender)
        }
    }
    
    @IBAction func pi(sender: UIButton) {
        appendNumber(M_PI.description)
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
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
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        displayValue = 0
        display.text = "0"
        consoleDisplay.text = "0"
        brain.clearStack()
    }
    
    //MARK: Private Methods
    
    private func appendNumber(number:String) {
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + number
        } else {
            display.text = number
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    //MARK: CalculatorBrainDelegate Methods
    
    func displayConsoleMessage(message: String) {
        consoleDisplay.text = message
    }
}

