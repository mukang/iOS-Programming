//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by 穆康 on 2018/4/27.
//  Copyright © 2018年 穆康. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenHeitValues: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Double? {
        if let value = fahrenHeitValues {
            return (value - 32.0) * (5.0 / 9.0)
        } else {
            return nil
        }
    }
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
    @IBAction func fahrenHeitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenHeitValues = number.doubleValue
        } else {
            fahrenHeitValues = nil
        }
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentLocal = NSLocale.current
        let decimalSeparator = currentLocal.decimalSeparator
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator!)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator!)
        
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}
