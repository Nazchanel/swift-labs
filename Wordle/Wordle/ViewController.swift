//
//  ViewController.swift
//  Wordle
//
//  Created by Iyer, Eshan R on 4/3/23.
//

import UIKit

var correctWord : String = ""

var allWords = [String]()

var colorList : [Int] = [0, 0, 0, 0, 0]

var currentLabelIndex : Int = 0
let wordLength : Int = 5
let guessAmount : Int = 6
var correctGuessesLeft : Int = guessAmount-1

var isFirstTime : Bool = true

var deadLetters : [String] = []

class ViewController: UIViewController {
    
    @IBOutlet weak var deadLetterLabel: UILabel!
    
    @IBOutlet var allLetters: [UILabel]!
    
    @IBOutlet weak var wordField: WordleEntry!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startWordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        wordSelection()
    }
    
    @IBAction func wordEntered(_ sender: Any) {
        let wordEntered = wordField.text!.uppercased()
        
        wordField.text = ""
        
        if wordEntered.count == wordLength
        {
            wordCheck(guess: wordEntered)
        }
        else
        {
            wordField.shake()
            
        }
    }
    
    func wordSelection()
    {
        correctWord = allWords.randomElement()!
        if correctWord.count != wordLength
        {
            wordSelection()
        }
        print("Correct Word: \(correctWord)")
        
        
    }
    
    func wordCheck(guess : String)
    {
        var tempList : [Int] = [0, 0, 0, 0, 0]
        
        let originalGuessArray = guess.split(separator: "")
        
        var guessArray = guess.split(separator: "")
        
        let correctWordArray = correctWord.split(separator: "")
        
        
        
        if isFirstTime{
            // Dead Letters Adder
            for i in [Int](0...guessArray.count-1)
            {
                let index = correctWordArray.firstIndex(of: guessArray[i])
                
                if index == nil
                {
                    deadLetters.append(String(guessArray[i]))
                    
                }
                
            }
            
            // Green Checker
            for i in [Int](0...guessArray.count-1)
            {
                if guessArray[i] == correctWordArray[i]
                {
                    
                    colorList[i] = 1
                    guessArray[i] = "&" // Prevents the yellow checker for mistaking a green for a yellow
                    
                }
            }
            
            // Yellow Checker
            for i in [Int](0...guessArray.count-1)
            {
                let index = correctWordArray.firstIndex(of: guessArray[i])
                if index != nil
                {
                    colorList[i] = 2
                }
                
            }
            isFirstTime = false
        }
        else
        {
            // Dead Letters Adder
            for i in [Int](0...guessArray.count-1)
            {
                let index = correctWordArray.firstIndex(of: guessArray[i])
                
                if index == nil
                {
                    deadLetters.append(String(guessArray[i]))
                    
                }
                
            }
            // Green Checker
            for i in [Int](0...guessArray.count-1)
            {
                if guessArray[i] == correctWordArray[i]
                {
                    
                    tempList[i] = 1
                    guessArray[i] = "&" // Prevents the yellow checker for mistaking a green for a yellow
                    
                }
            }
            
            // Yellow Checker
            for i in [Int](0...guessArray.count-1)
            {
                let index = correctWordArray.firstIndex(of: guessArray[i])
                if index != nil
                {
                    tempList[i] = 2
                }
                
            }
            
            
            colorList.append(contentsOf: tempList)
        }
        if tempList == [1, 1, 1, 1, 1] || colorList == [1, 1, 1, 1, 1]
        {
            displayWinAlert()
        }
        else if correctGuessesLeft > 0
        {
            correctGuessesLeft -= 1
            
        }
        else
        {
            displayLoseAlert()
        }
        deadLetterInitializer()
        setLabels(colorList: colorList, guessArray: originalGuessArray)
        
    }
    func setLabels(colorList : [Int], guessArray : [String.SubSequence])
    {
        var currentGuessIndex : Int = 0
        
        for i in [Int](currentLabelIndex...currentLabelIndex+4)
        {
            
            if colorList[i] == 1
            {
                allLetters[i].backgroundColor = #colorLiteral(red: 0.07419168204, green: 0.8280491829, blue: 0, alpha: 1)
            }
            if colorList[i] == 2
            {
                allLetters[i].backgroundColor = #colorLiteral(red: 0.8645705581, green: 0.8751729131, blue: 0, alpha: 1)
            }
            
            allLetters[i].text = String(guessArray[currentGuessIndex])
            currentGuessIndex += 1
            
        }
        currentLabelIndex += 5
        
    }
    
    func deadLetterInitializer()
    {
        let tempList = Array(Set(deadLetters))
        
        var tempStr : String = ""
        
        for i in tempList{
            tempStr += " \(i) "
        }
        
        
        
        deadLetterLabel.text = tempStr
        
        
    }
    
    func alertPressed()
    {
        if let startWordsURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        wordSelection()
        
        allWords = [String]()
        
        colorList = [0, 0, 0, 0, 0]
        
        currentLabelIndex = 0
        
        
        isFirstTime = true
        
        deadLetters = []
        
        deadLetterLabel.text = ""
        
        for i in allLetters
        {
            i.text = ""
            i.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        
        wordField.text = ""
        correctGuessesLeft = guessAmount-1
        
    }
    
    func displayLoseAlert()
    {
        let dialogMessage = UIAlertController(title: "You Lose!", message: "🙁", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in self.alertPressed()}))
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    func displayWinAlert()
    {
        let dialogMessage = UIAlertController(title: "You Win!", message: "Congratulations", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in self.alertPressed()}))
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        alertPressed()
    }
}
