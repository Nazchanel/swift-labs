//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Iyer, Eshan R on 9/30/22.
//

import UIKit

var currentBoard = ["","","","","","","","",""]

let initialBoard = ["","","","","","","","",""]

var xTurn : Bool = true

var result : Int = 0

// 0: No one has won
// 1: X has one
// 2: O has won
// 3: There is a tie

class ViewController: UIViewController {
    @IBOutlet weak var turnIndicator: UILabel!
    
    @IBOutlet weak var turnValidity: UILabel!

    @IBOutlet var allOutlets: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...8
        {
            // allOutlets[i].setTitle(String(i), for: .normal)
            allOutlets[i].setTitle(currentBoard[i], for: .normal)
            allOutlets[i].addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            allOutlets[i].tag = i
        }
        
        turnIndicator.text = "It is X's turn"
        
    }
    
    
    @objc func buttonPressed(_ sender: UIButton!)
    {
        // IF the current board is equal to
        var str = ""
        
        if xTurn
        {
            str = "X"
        }
        else
        {
            str = "O"
        }
        
        if currentBoard[sender.tag] != ""
        {
            turnValidity.text = "Go Again!"
        }
        
        else
        {
            if xTurn
        {
            xTurn = !xTurn
            currentBoard[sender.tag] = str
            
        }
        else
        {
            xTurn = !xTurn
            currentBoard[sender.tag] = str
            
        }
        
        allOutlets[sender.tag].setTitle(str, for: .normal)
        
        if xTurn
        {
            turnIndicator.text = "It's X's turn"
        }
        else
        {
            turnIndicator.text = "It's O's turn"
        }
        
        result = victoryCheck()
        
        if result == 0
        {
            result = tieCheck()
        }
        }
    }
    
    
}

func victoryCheck() -> Int
{
    if currentBoard[0] == "X" && currentBoard[1] == "X" && currentBoard[2] == "X"{
        print("X wins!")
        return 1
    }
    if currentBoard[3] == "X" && currentBoard[4] == "X" && currentBoard[5] == "X"
    {
        print("X wins! ")
        return 1
    }
    if currentBoard[6] == "X" && currentBoard[7] == "X" && currentBoard[8] == "X"{
        print("X wins! ")
        return 1
    }
    if currentBoard[0] == "O" && currentBoard[1] == "O" && currentBoard[2] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[3] == "O" && currentBoard[4] == "O" && currentBoard[5] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[6] == "O" && currentBoard[7] == "O" && currentBoard[8] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[0] == "X" && currentBoard[3] == "X" && currentBoard[6] == "X"{
        print("X wins! ")
        return 1
    }
    if currentBoard[1] == "X" && currentBoard[4] == "X" && currentBoard[7] == "X"{
        print("X wins! ")
        return 1
    }
    if currentBoard[2] == "X" && currentBoard[5] == "X" && currentBoard[8] == "X"{
        print("X wins! ")
        return 1
    }
    if currentBoard[0] == "O" && currentBoard[3] == "O" && currentBoard[6] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[1] == "O" && currentBoard[4] == "O" && currentBoard[7] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[2] == "O" && currentBoard[5] == "O" && currentBoard[8] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[0] == "X" && currentBoard[4] == "X" && currentBoard[8] == "X"{
        print("X wins! ")
        return 1
    }
    if currentBoard[6] == "X" && currentBoard[4] == "X" && currentBoard[2] == "X"{
        print("X wins! ")
        return 1
    }
    if currentBoard[0] == "O" && currentBoard[4] == "O" && currentBoard[8] == "O"{
        print("O wins! ")
        return 2
    }
    if currentBoard[6] == "O" && currentBoard[4] == "O" && currentBoard[2] == "O"{
        print("O wins! ")
        return 2
    }
    else
    {
        print("No win detected")
        return 0
    }
    
}

func tieCheck() -> Int
{
    var count: Int = 0
    
    for x in 0...8{
        if currentBoard[x] != initialBoard[x]{
            count+=1
        }
        
    }
    if count == 9{
        print("It's a tie!")
        return 3
        
    }
    else
    {
        return 0
    }
}

