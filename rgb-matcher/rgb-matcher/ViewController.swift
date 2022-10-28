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
    @IBOutlet weak var greenSlider: UISlider!
    
    var initialColor = [Float(0.0), Float(0.0), Float(0.0)]
    var RGB  = [Float(0.0), Float(0.0), Float(0.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a new alert
        let dialogMessage = UIAlertController(title: "Game Over", message: "Your score is 0", preferredStyle: .alert)

        // Present alert to user
        self.present(dialogMessage, animated: true, completion: nil)
        
        userColor.layer.borderColor = UIColor.darkGray.cgColor
        userColor.layer.backgroundColor = UIColor.white.cgColor
        userColor.layer.borderWidth = 2.0
        
        assignedColor.layer.borderColor = UIColor.darkGray.cgColor
        
        setGuessColor()
        assignedColor.layer.backgroundColor = UIColor(red: CGFloat(initialColor[0]), green: CGFloat(initialColor[1]), blue: CGFloat(initialColor[2]), alpha: 1).cgColor
        
        assignedColor.layer.borderWidth = 2.0
        
        
    }

    
    @IBAction func sliderChanged(_ sender: UISlider) {
        RGB = [redSlider.value, greenSlider.value, blueSlider.value]
        
        if RGB == initialColor
        {
            print("You win!")
            // Enter
        }
    }
    func setGuessColor()
    {
        let redValue = Float.random(in: 0...1)
        let blueValue = Float.random(in: 0...1)
        let greenValue = Float.random(in: 0...1)
        
        initialColor = [redValue, blueValue, greenValue]

    }
}
