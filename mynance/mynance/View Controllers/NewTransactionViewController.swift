//
//  NewTransactionViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/27/23.
//

import UIKit

let paymentTypes = ["Income", "Utilities", "Groceries", "Other Purchase"]

class NewTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var paymentPicker: UIPickerView!

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
        return paymentTypes[row]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
}
