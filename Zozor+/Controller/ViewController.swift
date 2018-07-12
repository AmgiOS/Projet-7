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

    override func viewDidLoad() {

    }
    
    func calculate() {
        textView.text = textView.text + "=\(operations.calculateTotal())"
    }
    
    func display() {
        textView.text = operations.updateDisplay()
    }
    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
               operations.addNewNumber(i)
            }
        }
        display()
    }

    @IBAction func plus() {
        if operations.canAddOperator {
        	operations.operators.append("+")
        	operations.stringNumbers.append("")
            display()
        }
    }

    @IBAction func minus() {
        if operations.canAddOperator {
            operations.operators.append("-")
            operations.stringNumbers.append("")
            display()
        }
    }

    @IBAction func equal() {
       calculate()
    }

    @IBAction func multiply() {
        if operations.canAddOperator {
            operations.operators.append("X")
            operations.stringNumbers.append("")
            display()
        }
    }

    @IBAction func diviser() {
        if operations.canAddOperator {
            operations.operators.append("/")
            operations.stringNumbers.append("")
         }
    }
    
    
}
