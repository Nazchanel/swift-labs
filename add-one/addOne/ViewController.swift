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
    override func viewDidLoad() {
        setNewNumber()
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    @objc func timerFunction(_ sender: UIButton!) {
         timer.invalidate()
         
         // 1 second until next question
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction2), userInfo: nil, repeats: true)
         
                  
         
        timeLabel.text = timer.
         
         }
     @objc
    func generateNumber() -> String {
        var digits = 4
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
    func setNewNumber(){
        number.text = generateNumber()
    }
}

