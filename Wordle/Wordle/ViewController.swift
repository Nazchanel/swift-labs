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

        print("\(allWords.count)\n")
        
        wordSelection()

    }

    @IBAction func wordEntered(_ sender: Any) {
        let wordEntered = wordField.text!.uppercased()
        
        wordField.text = ""

        print(correctWord)
        
        if wordEntered == correctWord
        {
            print("correct")
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
    
}

