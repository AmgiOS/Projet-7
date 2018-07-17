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
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty || stringNumber == "0" {
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
            operators.append("X")
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
        
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func calculateTotal() -> String {
        var total = 0
        if !isExpressionCorrect{
            return "0"
        }
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                } else if operators[i] == "X" {
                    total *= number
                } else if operators[i] == "/" {
                    total /= number
                }
            }
        }
        clear()
        return String(total)
    }
    
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
