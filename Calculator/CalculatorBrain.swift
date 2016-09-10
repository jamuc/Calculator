//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jason Franklin on 10/09/16.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import Foundation

class CalculatorBrain {

    var result: Double {
        get {
            return accumulator
        }
    }

    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch(operation) {
            case .Constant(let constant): accumulator = constant
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                performBinaryOperation()
                storeBinaryOperation(function)
            case .Equal: performBinaryOperation()
            }
        }
    }

    func setOperand(operand: Double) {
        accumulator = operand
    }

    // private

    private var accumulator = 0.0
    private var pendingOperation: PendingBinaryOperation? = nil

    private var operations = [
        "pi": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "sqrt": Operation.UnaryOperation({ sqrt($0) }),
        "cos": Operation.UnaryOperation({ cos($0) }),
        "×": Operation.BinaryOperation({ $0 * $1 }),
        "÷": Operation.BinaryOperation({ $0 / $1 }),
        "+": Operation.BinaryOperation({ $0 + $1 }),
        "-": Operation.BinaryOperation({ $0 - $1 }),
        "=": Operation.Equal
    ]

    private func performBinaryOperation() {
        if let op = pendingOperation {
            accumulator = op.storedBinaryOperation(op.firstBinaryOperand, accumulator)
            pendingOperation = nil
        }
    }

    private func storeBinaryOperation(function: (Double, Double) -> Double) {
        pendingOperation = PendingBinaryOperation(firstBinaryOperand: accumulator, storedBinaryOperation: function)
    }

    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equal
    }

    private struct PendingBinaryOperation {
        var firstBinaryOperand: Double
        var storedBinaryOperation: (Double, Double) -> Double
    }
}
