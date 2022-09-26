//
//  ViewController.swift
//  magicEightBall
//
//  Created by Iyer, Eshan R on 9/26/22.
//

import UIKit

let responses = ["It is certain.", "It is decidedly so.", "WWithout a doubt.", "Yes definetly.", "You may rely on it.", "As I see it, yes", "Most Likely", "Outlook good.", "Yes.", "Signs point to yes.", "Reply hazy, try again.", "Ask again later.", "Better not tell you now", "Cannot predict now.", "Concetrate and ask again.", "Don't count on it.", "My reply is no.", "Outlook not so good.", "Very doubtful"]

var canShake: Bool = true

var timer = Timer()

var timer2 = Timer()

var response = " "

var randomIndex: Int = 0
class ViewController: UIViewController {
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var eightBall: UILabel!
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake && canShake{
            message.text = "Answer Generating..."
            
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
            
        }
        
    }
    @objc func timerFunction(_ sender: UIButton!) {
        print("Timer fired!!")
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction2), userInfo: nil, repeats: true)
        
        
        randomIndex = Int.random(in: 0...responses.count-1)

        response = responses[randomIndex]
        
        message.text = response
        
        }
    @objc func timerFunction2(_ sender: UIButton!)
    {
        message.text = "Think of a question..."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eightBall.layer.cornerRadius = 190
        eightBall.layer.masksToBounds = true
        
        message.layer.cornerRadius = 125
        message.layer.masksToBounds = true
        message.text = "Think of a question..."
        
        self.view.backgroundColor = .systemBlue
    }
    
    
    
    
    
    
    
}

