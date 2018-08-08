//
//  Operations.swift
//  CountOnMe
//
//  Created by Amg on 12/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

protocol DisplayAlert {
    func showAlert(title: String, message: String)
}

class Operations {
    // MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    var displayAlertDelegate: DisplayAlert?
    
    //Check if stringNumber contains number else display error
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    displayAlertDelegate?.showAlert(title: "Zéro!", message: "Démarrez un nouveau calcul !")
                    clear()
                } else {
                    displayAlertDelegate?.showAlert(title: "Zéro!", message: "Entrez une expression correcte !")
                    clear()
                }
                return false
            }
        }
        return true
    }
    
    // can add operator if contains numbers
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                displayAlertDelegate?.showAlert(title: "Zéro!", message: "Expression incorrecte!")
                return false
            }
        }
        return true
    }
    
    // MARK: - Methods
    func plus() -> String {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func minus() -> String {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func multiply() -> String {
        if canAddOperator {
            operators.append("x")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func diviser() -> String {
        if canAddOperator {
            operators.append("/")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
        
    //Add number in textView
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    //Calculate result total
    func calculateTotal() -> String {
        if !isExpressionCorrect {
            return "0"
        }
        priorityCalcul()
        var total: Double = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        let result = String(format: "%.2f", total)
        clear()
        return String(result)
    }
    
    //Check if calcul contains multiply or diviser for priority calcul
    private func priorityCalcul() {
        let priorityOperators = ["x", "/"]
        var i = 0
        var result: Double = 0
        
        while i < stringNumbers.count - 1 {
            if var firstNumber = Double(stringNumbers[i]) {
                while priorityOperators.contains(operators[i + 1]) {
                    if let secondNumber = Double(stringNumbers[i + 1]) {
                        if operators[i + 1] == "x" {
                            result = firstNumber * secondNumber
                        } else if operators[i + 1] == "/" {
                            result = firstNumber / secondNumber
                        }
                        stringNumbers[i] = String(result)
                        firstNumber = result
                        stringNumbers.remove(at: i + 1)
                        operators.remove(at: i + 1)
                        if i == stringNumbers.count - 1 { return }
                    }
                }
                i += 1
            }
        }
    }
    
    //Update Display TextView
    func updateDisplay() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }

    private func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
}
