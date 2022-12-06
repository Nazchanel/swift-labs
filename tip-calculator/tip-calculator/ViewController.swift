//
//  ViewController.swift
//  tip-calculator
//
//  Created by Iyer, Eshan R on 11/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountInput: UITextField!
    
    @IBOutlet weak var totalTip: UILabel!
    
    @IBOutlet weak var tipSelection: UISegmentedControl!
    
    @IBOutlet weak var totalBill: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var otherEntry: UITextField!
    
    var tipTotal : Double = 0
    var billAmount : Double = 0
    var tipPercent : Double = 15
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        otherEntry.isHidden = true
        
        otherEntry.addTarget(self, action: #selector(ViewController.tipPercentChanged(_:)), for: .editingChanged)
        
        billAmountInput.addTarget(self, action: #selector(ViewController.billChanged(_:)), for: .editingChanged)
        
    }

    @IBAction func otherSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 3 {
            otherEntry.isHidden = false
        }
        else if sender.selectedSegmentIndex == 0
        {
            otherEntry.isHidden = true
            tipPercent = 15
            
        }
        else if sender.selectedSegmentIndex == 1
        {
            otherEntry.isHidden = true
            tipPercent = 18
        }
        else if sender.selectedSegmentIndex == 2
        {
            otherEntry.isHidden = true
            tipPercent = 20
        }
                
        calculateTipAmount()
        calculateBillAmount()
    }
    
   @objc func tipPercentChanged(_ textField: UITextField) {
       tipPercent = Double(otherEntry.text!) ?? 0.0
       
       calculateTipAmount()
       calculateBillAmount()
       
    }
    @objc func billChanged(_ textField: UITextField) {
        billAmount = Double(billAmountInput.text!) ?? 0.0
                
        calculateTipAmount()
        calculateBillAmount()
     }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        // Resets all values to original
        
        tipTotal = 0
        billAmount = 0
        tipPercent = 15
        
        totalBill.text = "$0.00"
        totalTip.text = "$0.00"
        
        otherEntry.isHidden = true
        
        billAmountInput.text = ""
        otherEntry.text = ""
        
        tipSelection.selectedSegmentIndex = 0
        
        
    }
    
    func calculateTipAmount()
    {
        tipTotal = billAmount * (tipPercent/100.0)

        totalTip.text = "$\(String(format: "%.2f", tipTotal))"
        
    }
    func calculateBillAmount()
    {
        totalBill.text = "$\(String(format: "%.2f", billAmount + tipTotal))"
    }

    
}

