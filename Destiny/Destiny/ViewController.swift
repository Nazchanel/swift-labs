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
    
    @IBAction func choiceOnePressed(_ sender: Any) {
        print(game.currentStory)
        if game.currentStory == -1{
            choiceOne.isHidden = true
            print("hidden")
        }
        else{
            
        game.currentStory = game.stories[game.currentStory].choice1index
        choiceOne.setTitle(game.returnChoiceOne(), for: .normal)
        label1.text = game.returnTitle()
            
        }
        
    }
    
    @IBAction func choiceTwoPressed(_ sender: Any) {
        print(game.currentStory)
        if game.currentStory == -1
        {
            choiceTwo.isHidden = true
            print("hidden")
            //return
        }
        else
        {
        game.currentStory = game.stories[game.currentStory].choice2index
        choiceTwo.setTitle(game.returnChoiceTwo(), for: .normal)
        label1.text = game.returnTitle()
        }   
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = game.returnTitle()
        
        choiceOne.setTitle(game.returnChoiceOne(), for: .normal)
        choiceTwo.setTitle(game.returnChoiceTwo(), for: .normal)
    }
}
