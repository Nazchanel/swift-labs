//
//  ViewController.swift
//  Wordle
//
//  Created by Iyer, Eshan R on 4/3/23.
//

import UIKit
import Foundation

var correctWord : String = ""

class ViewController: UIViewController {
    var allWords = [String]()
    var colorList = []
    var currentLabelIndex : Int = 0
    
    let wordLength : Int = 5
    let guessAmount : Int = 6
    
    @IBOutlet weak var deadLetterLabel: UILabel!
    
    @IBOutlet var allLetters: [UILabel]!
    
    @IBOutlet weak var wordField: UITextField!
    
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
    }
    
    
    func wordSelection()
    {
        correctWord = allWords.randomElement()!
        if correctWord.count != wordLength
        {
            wordSelection()
        }
        
    }
    
    func wordCheck(guess : String)
    {
        var guessArray = guess.split(separator: "")
        let correctWordArray = correctWord.split(separator: "")
        
        // 1 is green, 2 is yellow, and 0 is grey
        var tempcolorList : [Int] = [0, 0, 0, 0, 0]
        
        print("Correct Word: \(correctWord)")
        print("Guess Word: \(guess)")
        
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
        setLabels(colorList: colorList)
        
    }
    func setLabels(colorList : [Int])
    {
        
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
            
            
        }
        currentLabelIndex += 5
        
    }
    
    
}

