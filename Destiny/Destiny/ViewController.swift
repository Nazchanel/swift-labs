//
//  ViewController.swift
//  Destiny
//
//  Created by Iyer, Eshan R on 9/12/22.
//

import UIKit
var game = Destiny()

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    
    @IBOutlet weak var setting: UIImageView!
    
    @IBAction func choiceOnePressed(_ sender: Any) {
        
        // Hides the button when game ends
        if game.returnChoiceOne() == "The"{
            choiceOne.isHidden = true
            choiceTwo.isHidden = true
            print("hidden")
        }
        else{
        
            
        game.currentStory = game.stories[game.currentStory].choice1index
        
            // Sets label text
        choiceOne.setTitle(game.returnChoiceOne(), for: .normal)
        choiceTwo.setTitle(game.returnChoiceTwo(), for: .normal)
             
        // set room description
        label1.text = game.returnTitle()
            
        }
        
    }
    
    @IBAction func choiceTwoPressed(_ sender: Any) {
        if game.returnChoiceTwo() == "End"
        {
            choiceTwo.isHidden = true
            choiceOne.isHidden = true
            print("hidden")
        }
        else
        {
        game.currentStory = game.stories[game.currentStory].choice2index
        
        choiceOne.setTitle(game.returnChoiceOne(), for: .normal)
        choiceTwo.setTitle(game.returnChoiceTwo(), for: .normal)
            
        label1.text = game.returnTitle()
        }   
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = game.returnTitle()
        choiceOne.setTitle(game.returnChoiceOne(), for: .normal)
        choiceTwo.setTitle(game.returnChoiceTwo(), for: .normal)
        setting.image = UIImage(named: "background.jpg")
    }
}
