//
//  BasicFunctions.swift
//  Calculator
//
//  Created by Manish Agarwal on 04/07/24.
//

import Foundation


class BasicFunctions: ObservableObject {
    
    @Published var display = "0"
    @Published var currentOperation: String?
    @Published var firstOperand: Double?
    @Published var secondOperand: Double?
    
    func buttonAction(_ button: String) {
        switch button {
        case "AC":
            clear()
        case "+/-":
            toggleSign()
        case "%":
            applyPercentage()
        case "÷", "×", "-", "+":
            setOperation(button)
        case "=":
            calculateResult()
        case ".":
            appendDecimal()
        default:
            appendDigit(button)
        }
    }
    
    func clear() {
        display = "0"
        currentOperation = nil
        firstOperand = nil
        secondOperand = nil
    }
    
    func toggleSign() {
        if let value = Double(display) {
            display = String(value * -1)
        }
    }
    
    func applyPercentage() {
        if let value = Double(display) {
            display = String(value / 100)
        }
    }
    
    func setOperation(_ operation: String) {
        firstOperand = Double(display)
        currentOperation = operation
        display = "0"
    }
    
    func calculateResult() {
        if let operation = currentOperation,
           let firstValue = firstOperand,
           let secondValue = Double(display) {
            var result: Double?
            
            switch operation {
            case "÷":
                result = firstValue / secondValue
            case "×":
                result = firstValue * secondValue
            case "-":
                result = firstValue - secondValue
            case "+":
                result = firstValue + secondValue
            default:
                break
            }
            
            if let result = result {
                display = String(result)
                currentOperation = nil
                firstOperand = nil
                secondOperand = nil
            }
        }
    }
    
    func appendDecimal() {
        if !display.contains(".") {
            display.append(".")
        }
    }
    
    func appendDigit(_ digit: String) {
        if display == "0" {
            display = digit
        } else {
            display.append(digit)
        }
    }
    
}
