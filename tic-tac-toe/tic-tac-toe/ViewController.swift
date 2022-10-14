//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Iyer, Eshan R on 9/30/22.
//

import UIKit

var currentBoard = ["","","","","","","","",""]

var xTurn : Bool = true

var result : Int = 0

var gamePlay : Bool = true

// 0: No one has won
// 1: X has one
// 2: O has won

class ViewController: UIViewController {
    @IBOutlet weak var restartButton: UIButton!
    
    // Returns everything back to initial state
    @IBAction func restartPressed(_ sender: Any) {
        print("Restart Pressed")
        turnValidity.isHidden = false
        
        restartButton.isHidden = true
        
        currentBoard = ["","","","","","","","",""]
        
        xTurn = true
        
        result = 0
        
        gamePlay = true
        
        turnValidity.text = ""
        
        for i in 0...8
        {
            allOutlets[i].setTitle(currentBoard[i], for: .normal)
            allOutlets[i].addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
            allOutlets[i].tag = i
        }
        
        turnIndicator.text = "It is X's turn"
    }
    @IBOutlet weak var turnIndicator: UILabel!
    
    @IBOutlet weak var turnValidity: UILabel!
    
    @IBOutlet var allOutlets: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        turnValidity.text = ""
        
        // Sets the buttons initial text, and assigns a tag to each one
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
    
    
    @objc func buttonPressed(_ sender: UIButton!)
    {
        if gamePlay == true
        {
            var str = ""
            
            // Makes the string to look for the current player
            if xTurn
            {
                str = "X"
            }
            else
            {
                str = "O"
            }
            
            // If there is something in that spot tell the player to go again
            if currentBoard[sender.tag] != ""
                
            {
                turnValidity.text = "Go Again!"
                
                // Delay to disappear
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(700)) {
                    self.turnValidity.text = ""
                }
                
            }
            // If the turn is valid
            else
            {
                if xTurn
                {
                    // Resets the turn to the next player
                    xTurn = !xTurn
                    
                    // Sets the entry in the list to the selected button
                    currentBoard[sender.tag] = str
                }
                else
                {
                    // Resets the turn to the next player
                    xTurn = !xTurn
                    
                    // Sets the entry in the list to the selected button
                    currentBoard[sender.tag] = str
                }
                
                allOutlets[sender.tag].setTitle(str, for: .normal)
                
                // Switches the indicator text to the current turn
                if xTurn
                {
                    turnIndicator.text = "It's X's turn"
                }
                else
                {
                    turnIndicator.text = "It's O's turn"
                }
                
                result = victoryCheck()
                
                // If nobody won
                if result == 0
                {
                    if tieCheck()
                    {
                        gamePlay = false
                        turnValidity.isHidden = true
                        turnIndicator.text = "It's a tie!"
                        restartButton.isHidden = false
                    }
                }
                // If X won
                else if result == 1
                {
                    gamePlay = false
                    turnValidity.isHidden = true
                    turnIndicator.text = "X wins!"
                    restartButton.isHidden = false
                    
                }
                // If O wins
                else
                {
                    gamePlay = false
                    turnValidity.isHidden = true
                    turnIndicator.text = "O Wins!"
                    restartButton.isHidden = false
                }
            }
        }
    }
}

// Large series of if-statements that checks if there is a winner
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

func tieCheck() -> Bool
{
    var count: Int = 0
    
    for x in 0...8{
        if currentBoard[x] != ""{
            count+=1
        }
        
    }
    
    // If all buttons have text it's a tie
    if count == 9{
        print("It's a tie!")
        return true
        
    }
    else
    {
        return false
    }
}
