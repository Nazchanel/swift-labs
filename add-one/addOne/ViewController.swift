//
//  ViewController.swift
//  addOne
//
//  Created by Iyer, Eshan R on 12/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var userInput: UITextField!
    
    var timer = Timer() // Timer for generation
    
    var time : Int = 60
    
    var score = 0
    
    var currentNumber : Int = 0
    
    override func viewDidLoad() {
        setNewNumber()
        
        timeLabel.text = "60"
        
        scoreLabel.text = String(score)
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        userInput.addTarget(self, action: #selector(ViewController.userInputChanged(_:)), for: .editingChanged)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    func generateNumber() -> String {
        let digits = 4
        var number = String()
        for _ in 1...digits {
            number += "\(Int.random(in: 1...9))"
        }
        currentNumber = Int(number)!
        return number
    }
    func setNewNumber(){
        number.text = generateNumber()
    }
    @objc func timerFunction() {
        timer.invalidate()
        
        time -= 1
        if time == 0
        {
            displayAlert()
        }
        else{
            
            timeLabel.text = String(format: "%02d", time)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    func displayAlert()
    {
        let dialogMessage = UIAlertController(title: "Game Over!", message: "Score: \(score)", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "Click to restart", style: .default, handler: {_ in self.alertPressed()}))
        
        self.present(dialogMessage, animated: true, completion: nil)
        
        
    }
    func alertPressed()
    {
        // Resets everything to original values
        
        time = 60
        
        setNewNumber()
        
        userInput.text = ""
        timeLabel.text = String(time)
        
        scoreLabel.text = "0"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    func getAnswer() -> String
    {
        var correctNumber: String = ""
        let splitInputText = Array(number.text!)
        var integerArray = [0, 0, 0, 0]
        
        for i in 0...3
        {
            let temp = splitInputText[i]
            
            integerArray[i] = Int(String(temp))!
            integerArray[i] += 1
            correctNumber += String(integerArray[i])
        }
        return correctNumber
        
    }
    func checkNumber()
    {
        let currentInputText = userInput.text!
        
        if currentInputText == getAnswer()
        {
            // User inputted correct answer
            score += 1
            
            scoreLabel.text = String(score)
            
            userInput.text = ""
            
            setNewNumber()
            
            print("point")
            
        }
        else
        {
            // User inputted wrong number
            score -= 1
            scoreLabel.text = String(score)
            
            userInput.text = ""
            
            print("wrong")
        }
    }
    @objc func userInputChanged(_ textField: UITextField) {
        let currentInput = userInput.text
        
        if currentInput!.count != 4
        {
            print("Invalid input")
        }
        else
        {
            checkNumber()
        }
        
        
    }
}

