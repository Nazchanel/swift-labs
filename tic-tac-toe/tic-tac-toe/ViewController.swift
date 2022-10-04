//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Iyer, Eshan R on 9/30/22.
//

import UIKit

var currentBoard = ["","","","","","","","",""]
var xTurn : Bool = true

class ViewController: UIViewController {
    @IBOutlet weak var turnIndicator: UILabel!
    
    
    @IBOutlet var allOutlets: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...8
        {
            allOutlets[i].setTitle(currentBoard[i], for: .normal)
            allOutlets[i].addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            allOutlets[i].tag = i
        }
        
        turnIndicator.text = "It is X's turn"
        
    }
    
    
    @objc func buttonPressed(_ sender: UIButton!)
    {
        var str = ""
        
        if xTurn
        {
            str = "X"
        }
        else
        {
            str = "O"
        }
        
        allOutlets[sender.tag].setTitle(str, for: .normal)
        
    }
    
    
}

