//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Iyer, Eshan R on 9/30/22.
//

import UIKit

var currentBoard = ["","","","","","","","",""]

class ViewController: UIViewController {


    @IBOutlet var allOutlets: [UIButton]!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func square1pressed(_ sender: Any) {
        allOutlets[0].setTitle(currentBoard[0], for: .normal)
        allOutlets[1].setTitle(currentBoard[1], for: .normal)
        allOutlets[2].setTitle(currentBoard[2], for: .normal)
        allOutlets[3].setTitle(currentBoard[3], for: .normal)
        allOutlets[4].setTitle(currentBoard[4], for: .normal)
        allOutlets[5].setTitle(currentBoard[5], for: .normal)
        allOutlets[6].setTitle(currentBoard[6], for: .normal)
        allOutlets[7].setTitle(currentBoard[7], for: .normal)
        allOutlets[8].setTitle(currentBoard[8], for: .normal)
        
        
    }
    

}

