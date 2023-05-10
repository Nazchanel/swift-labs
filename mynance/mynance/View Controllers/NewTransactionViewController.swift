//
//  NewTransactionViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/27/23.
//

import UIKit





class NewTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let paymentTypes = ["Income", "Utilities", "Groceries", "Other Purchase"]

    var moneyEntered : String = ""

    var descriptionEntered : String = ""

    var selectedPaymentType : String = ""

    let userDefaults = UserDefaults.standard
    
    var transactionList : [Transaction] = []
    
        
    @IBOutlet weak var paymentPicker: UIPickerView!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var moneyField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.paymentPicker.delegate = self
        self.paymentPicker.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if let data = UserDefaults.standard.data(forKey: "Transactions") {
            let acct = try! JSONDecoder().decode([Transaction].self, from: data)
            transactionList = acct
        }
        else
        {
            let trs : [Transaction] = []
            userDefaults.set(trs, forKey: "Transactions")

        }
        

        print("Transaction Count: \(transactionList.count)")

//        transactionList = userDefaults.object(forKey: "Transactions") as? [Transaction] ?? []
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paymentTypes.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedPaymentType = paymentTypes[row]
        
        
        return paymentTypes[row]
        
    }
    
    @IBAction func descriptionFieldChanged(_ sender: Any) {
        descriptionEntered = descriptionField.text!
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueIdentifier : String = segue.identifier!
        
        var category : Transaction.Category = .Groceries
        
        if selectedPaymentType == "Income"
        {
            category = .Income
        }
        else if selectedPaymentType == "Utilities"
        {
            category = .Utilities
        }
        
        if segueIdentifier == "save"
        {
            let currentTransaction = Transaction(amount: moneyEntered, date: returnCurrentDate(), description: descriptionEntered, category: category)
            
            transactionList.append(currentTransaction)
            print("\nPost-Append: \(transactionList)\n")
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()

                // Encode Note
                let data = try encoder.encode(transactionList)

                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "Transactions")
                print("\n\n\nData Saved: \(data)\n\n\n")

            } catch {
                print("Unable to Encode Note (\(error))")
            }
            
            
            
        }
        else if segueIdentifier == "cancel"
        {
            print("canceled")
        }
    }
    func returnCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
         
        dateFormatter.dateFormat = "MM/dd/yyyy"
         
        let result = dateFormatter.string(from: date)
        return result
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

