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
        operations.displayAlertDelegate = self
    }

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
               operations.addNewNumber(i)
            }
        }
        textView.text = operations.updateDisplay()
    }

    @IBAction func tappedOperator(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            textView.text = operations.multiply()
        case 1:
            textView.text = operations.diviser()
        case 2:
            textView.text = operations.plus()
        case 3:
            textView.text = operations.minus()
        case 4:
            textView.text = operations.calculateTotal()
        default:
            break
        }
    }
    
    func convert() {
        if let cost = Double(textView.text!) {
            print("Result in Double is \(cost)")
        } else {
            print("Not a valid number: \(textView.text!)")
        }
    }
}

extension ViewController: DisplayAlert {
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
