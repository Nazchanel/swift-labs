//
//  ViewController.swift
//  apple-pie
//
//  Created by Iyer, Eshan R on 11/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var allKeys: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...8
        {
            // allOutlets[i].setTitle(String(i), for: .normal)
            allOutlets[i].setTitle("", for: .normal)
            allOutlets[i].addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            allOutlets[i].tag = i
        }
        
        // X goes first
        turnIndicator.text = "It is X's turn"
        
        restartButton.isHidden = true
        
    }
    }
    


}

