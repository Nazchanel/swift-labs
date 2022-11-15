//
//  ViewController.swift
//  apple-pie
//
//  Created by Iyer, Eshan R on 11/11/22.
//

import UIKit


class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    
    var currentGame : Game!
    let incorrectMovesAllowed = 0
    
    var totalWins = 0 {
        didSet
        {
            newRound()
        }
    }
    
    var totalLosses = 0
    {
        didSet {
            newRound()
        }
    }
    
    
    @IBOutlet var allKeys: [UIButton]!
    
    @IBOutlet weak var treeImage: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        
        
    }

    func newRound()
    {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            // Left off here
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
        
    }
    func updateUI()
    {
        var letters = [String]()
        
        for letter in currentGame.formattedWord
        {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
        
    }
    func updateGameState()
    {
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }
        else if currentGame.word == currenGame.formattedWord {
            totalWins += 1
        }
        else
        {
            updateUI()
        }
    }
    
}
