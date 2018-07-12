//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Properties
    var operations = Operations()

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
               operations.addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        if operations.canAddOperator {
        	operations.operators.append("+")
        	operations.stringNumbers.append("")
            operations.updateDisplay()
        }
    }

    @IBAction func minus() {
        if operations.canAddOperator {
            operations.operators.append("-")
            operations.stringNumbers.append("")
            operations.updateDisplay()
        }
    }

    @IBAction func equal() {
        operations.calculateTotal()
    }

    @IBAction func multiply() {
        if operations.canAddOperator {
            operations.operators.append("X")
            operations.stringNumbers.append("")
            operations.updateDisplay()
        }
    }

    @IBAction func diviser() {
        if operations.canAddOperator {
            operations.operators.append("/")
            operations.stringNumbers.append("")
            operations.updateDisplay()
        }
    }
    
    
}
