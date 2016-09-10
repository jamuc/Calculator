//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jason Franklin on 10/09/16.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import Foundation

class CalculatorBrain {

    private var accumulator = 0.0

    func performOperation(symbol: String) {
        switch(symbol) {
            case "pi": accumulator = M_PI
            case "sqrt": accumulator = sqrt(accumulator)
            default: break
        }
    }

    func setOperand(operand: Double) {
        accumulator = operand
    }

    var result: Double {
        get {
            return accumulator
        }
    }
}
