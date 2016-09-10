//
//  ViewController.swift
//  Calculator
//
//  Created by Jason Franklin on 02/09/16.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddelOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let title = sender.currentTitle!
        
        if userIsInTheMiddelOfTyping {
            display.text! += title
        } else {
            display.text = title
        }
        userIsInTheMiddelOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }

        set {
            display.text = String(newValue)
        }
    }

    private var calculator = CalculatorBrain()
    @IBAction private func performOperation(sender: UIButton) {
        userIsInTheMiddelOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            calculator.setOperand(displayValue)
            calculator.performOperation(mathematicalSymbol)
            displayValue = calculator.result
        }
    }
}

