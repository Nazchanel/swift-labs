//
//  landingVC.swift
//  Voluntracker
//
//  Created by Iyer, Eshan R on 1/26/23.
//

import UIKit

var currentHours: Int = 0

class landingVC: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var hoursEntry: UITextField!
    
    var welcomeMessage : String = ""
    
    override func viewDidLoad() {
        
        welcomeLabel.text! = welcomeMessage
        
        super.viewDidLoad()
        
    }
    
    @IBAction func hoursEntered(_ sender: Any) {
        currentHours = Int(hoursEntry.text!) ?? 0
        print(currentHours)
    }
}
