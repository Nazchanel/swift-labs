//
//  ViewController.swift
//  rgb-matcher
//
//  Created by Iyer, Eshan R on 10/26/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userColor: UILabel!
    @IBOutlet weak var assignedColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userColor.layer.borderColor = UIColor.darkGray.cgColor
        userColor.layer.borderWidth = 2.0
        
        assignedColor.layer.borderColor = UIColor.darkGray.cgColor
        assignedColor.layer.borderWidth = 2.0

    }


}

