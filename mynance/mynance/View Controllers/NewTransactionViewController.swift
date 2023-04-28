//
//  NewTransactionViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/27/23.
//

import UIKit

let paymentTypes = ["Income", "Utilities", "Groceries", "Other Purchase"]

var moneyEntered : String = ""

var descriptionEntered : String = ""

var selectedPaymentType : String = ""

class NewTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let defaults = UserDefaults.standard
    
    var users: [String: String] = [:]
    
    @IBOutlet weak var paymentPicker: UIPickerView!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var moneyField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.paymentPicker.delegate = self
        self.paymentPicker.dataSource = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paymentTypes.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedPaymentType = paymentTypes[row]
        
        print(paymentTypes[row])
        
        return paymentTypes[row]
        
    }
    
    @IBAction func descriptionFieldChanged(_ sender: Any) {
        descriptionEntered = descriptionField.text!
        
        print(descriptionField.text!)
    }
    @IBAction func moneyFieldChanged(_ sender: Any) {
        
        if let amountString = moneyField.text?.currencyInputFormatting() {
            moneyField.text = amountString
        }
        moneyEntered = moneyField.text!.replacingOccurrences(of: "$", with: "")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func saveTest(_ sender: Any) {
        // Do after save is pressed
        
    }
    
    
}
extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
}

