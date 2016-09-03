//
//  ViewController.swift
//  Calculator
//
//  Created by Jason Franklin on 02/09/16.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddelOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let title = sender.currentTitle!
        
        if userIsInTheMiddelOfTyping {
            display.text! += title
        } else {
            display.text = title
        }
        userIsInTheMiddelOfTyping = true
    }
    
    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddelOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "pi" {
                display.text = String(M_PI)
            }
        }
    }
}

