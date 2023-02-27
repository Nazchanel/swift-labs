//
//  playPage.swift
//  Trivia
//
//  Created by Iyer, Eshan R on 2/23/23.
//

import UIKit

class playPage: UIViewController {
    var questionNumberSelected : Int = 0
    var categorySelected : String = ""
    
    var currentQuestion : Trivia = Trivia(q: "", correct: "", incorrect: [""])
    
    @IBOutlet var answerChoices: [UIButton]!
    
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...3
        {
            answerChoices[i].addTarget(self, action: #selector(answerChoicePressed(_:)), for: .touchUpInside)
            answerChoices[i].backgroundColor = .blue
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        print()
//        print("Question Number Selected: \(questionNumberSelected)")
//        print("Category Selected: \(categorySelected)")
//        print()
        
        currentQuestion = getQuestion()
        
        setup()
        
        
        
    }

    func getQuestion() -> Trivia
    {
        
        for (type,question ) in Trivia.triviaQuestions {
            if type == categorySelected
            {
                for i in question {
                    if i.q != currentQuestion.q
                    {
                        return i
                    }
                    
                }
            }
        }
        return Trivia(q: "", correct: "", incorrect: [""])
        
    }
    func setup()
    {
        var listofchoices : [String] = []
        listofchoices += currentQuestion.incorrect
        listofchoices.append(currentQuestion.correct)

        var j : Int = 0
        
        listofchoices.shuffle()
        
        for i in answerChoices
        {
            
            i.setTitle(listofchoices[j] , for: .normal)
            
            j += 1

        }
        questionLabel.text = currentQuestion.q
    }
    
    @objc func answerChoicePressed(_ sender: UIButton!)    {
        let answerPicked = sender.titleLabel!.text!
        
        if answerPicked == currentQuestion.correct
        {
            print("correct")
            
            UIView.animate(withDuration: 0.3, animations: {
                sender.backgroundColor = .green
            }, completion: { (complete: Bool) in
//                sender.backgroundColor = .blue
                return
            })

        }
        else
        {
            UIView.animate(withDuration: 0.3, animations: {
                sender.backgroundColor = .red
            }, completion: { (complete: Bool) in
//                sender.backgroundColor = .blue
                return
            })
        }
        
    }
    
}
