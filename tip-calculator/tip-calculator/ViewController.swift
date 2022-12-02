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
    
    @IBOutlet weak var otherEntry: UITextField!
    
    var billTotal : Double = 0
    var tipTotal : Double = 0
    var userTipPercent : Double = 0
    var billAmount : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

