//
//  ViewController.swift
//  IBBasics
//
//  Created by Iyer, Eshan R on 8/23/22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
    }
    
    @IBOutlet var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myButton.tintColor = .red
    }


}

