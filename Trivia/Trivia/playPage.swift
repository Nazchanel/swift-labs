//
//  playPage.swift
//  Trivia
//
//  Created by Iyer, Eshan R on 2/23/23.
//

import UIKit

class playPage: UIViewController {
    var questionNumberSelected : Double = 0
    
    var correctAnswerAmount : Double = 0
    
    var currentQuestionNumber : Double = 0
    
    // (correct question variable)
    
    var categorySelected : String = ""
    
    let triviaQuestions : [String : [Trivia]] = Trivia.triviaQuestions
    
    var listOfQuestions = [Trivia(q: "", correct: "", incorrect: [""])]
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var currentQuestion : Trivia = Trivia(q: "", correct: "", incorrect: [""])
    
    @IBOutlet var answerChoices: [UIButton]!
    
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        
        listOfQuestions = triviaQuestions[categorySelected]!
        
        progressBar.progress = 0
        
        for i in 0...3
        {
            answerChoices[i].addTarget(self, action: #selector(answerChoicePressed(_:)), for: .touchUpInside)
            answerChoices[i].backgroundColor = .blue
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        listOfQuestions = triviaQuestions[categorySelected]!
        
        currentQuestion = getQuestion()
        
        progressBar.progress = 0
        
        setup()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "winScreen"
        {
            let destinationVC = segue.destination as? gameOverPage
            destinationVC?.score = correctAnswerAmount
            destinationVC?.totalQuestions = questionNumberSelected
            
        }
    }
    
    func getQuestion() -> Trivia
    {
        for i in listOfQuestions
        {
            listOfQuestions.removeFirst()
            return i
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
            correctAnswerAmount += 1
            
            currentQuestionNumber += 1
            
            nextQuestion()
            
            
        }
        else
        {
            
            currentQuestionNumber += 1
            
            nextQuestion()
            
        }
        
    }
    func nextQuestion(){
        if (currentQuestionNumber / questionNumberSelected) >= 1
        {
            endGame()
        }
        progressBar.progress = Float(currentQuestionNumber / questionNumberSelected)
        
        currentQuestion = getQuestion()
        
        setup()
        
        
    }
    func endGame()
    {
        print("Gamer Over!")
        progressBar.progress = 0.0
        currentQuestionNumber = 0
        
        performSegue(withIdentifier: "winScreen", sender: nil)
    }
    func assignbackground()
    {
        let background = UIImage(named: "walkway.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}
