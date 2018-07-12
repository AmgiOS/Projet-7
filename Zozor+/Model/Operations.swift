//
//  Operations.swift
//  CountOnMe
//
//  Created by Amg on 12/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

class Operations {
    // MARK: - Properties
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                            self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte!", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    // MARK: - Methods
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func calculateTotal() -> Int {
        var total = 0
        if !isExpressionCorrect{
            return 0
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
        return total
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
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
    
}
