//
//  ViewController.swift
//  rgb-matcher
//
//  Created by Iyer, Eshan R on 10/26/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userColor: UILabel!
    @IBOutlet weak var assignedColor: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    
    var timer = Timer()
    
    var initialColor = [Float(0.0), Float(0.0), Float(0.0)]
    var RGB  = [Float(0.0), Float(0.0), Float(0.0)]
    var time : Int = 10 // Amount of time on the timer
    
    var win = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userColor.layer.borderColor = UIColor.darkGray.cgColor
        userColor.layer.backgroundColor = UIColor.white.cgColor
        userColor.layer.borderWidth = 2.0
        
        assignedColor.layer.borderColor = UIColor.darkGray.cgColor
        
        setGuessColor()
        assignedColor.layer.backgroundColor = UIColor(red: CGFloat(initialColor[0]), green: CGFloat(initialColor[1]), blue: CGFloat(initialColor[2]), alpha: 1).cgColor
        
        timerText.text = String(time)
        
        assignedColor.layer.borderWidth = 2.0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        RGB = [redSlider.value, greenSlider.value, blueSlider.value]
        
        userColor.layer.backgroundColor = UIColor(red: CGFloat(RGB[0]), green: CGFloat(RGB[1]), blue: CGFloat(RGB[2]), alpha: 1).cgColor
        
        if RGB == initialColor
        {
            win = true
            gameOver()
        }
    }
    func setGuessColor()
    {
        let redValue = Float.random(in: 0...1)
        let blueValue = Float.random(in: 0...1)
        let greenValue = Float.random(in: 0...1)
        
        initialColor = [redValue, blueValue, greenValue]
        
    }
    
    func displayAlert()
    {
          let dialogMessage = UIAlertController(title: "Game Over!", message: "Game Score: \(calculateScore())", preferredStyle: .alert)
            
            dialogMessage.addAction(UIAlertAction(title: "Click to restart", style: .default, handler: {_ in self.alertPressed()}))
            
            self.present(dialogMessage, animated: true, completion: nil)
            
        
    }
    
    @objc func timerFunction() {
        timer.invalidate()
        
        time -= 1
        if time == 0
        {
            gameOver()
        }
        else{
            timerText.text = String(time)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    func gameOver()
    {
        displayAlert()
        
    }
    
    func calculateScore() -> Int
    {
        let diff = sqrt(pow(RGB[0]-initialColor[0], 2) + pow(RGB[1]-initialColor[1], 2) + pow(RGB[2]-initialColor[2], 2)) // Algorithim to calculate score
        var score = (1 - diff) * 100
        if score < 0
        {
            score = 0
        }
        
        return Int(score)
    }
    
    func alertPressed()
    {
        // Resets everything to original values
        initialColor = [Float(0.0), Float(0.0), Float(0.0)]
        RGB  = [Float(0.0), Float(0.0), Float(0.0)]
        time = 15
        
        win = false
        
        redSlider.value = 0.5
        blueSlider.value = 0.5
        greenSlider.value = 0.5
        
        userColor.layer.backgroundColor = UIColor.white.cgColor
        
        assignedColor.layer.borderColor = UIColor.darkGray.cgColor
        
        setGuessColor()
        assignedColor.layer.backgroundColor = UIColor(red: CGFloat(initialColor[0]), green: CGFloat(initialColor[1]), blue: CGFloat(initialColor[2]), alpha: 1).cgColor
        
        timerText.text = String(time)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
}
