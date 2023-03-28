//
//  ViewController.swift
//  captcha
//
//  Created by Iyer, Eshan R on 3/20/23.
//

import UIKit

var imageList : [String] = []


var correctAnswer : String = ""

var selectedAnswer : String = ""

var incorrectAnswers : Int = 0

class ViewController: UIViewController {
    @IBOutlet var imageViews: [CaptchaImageView]!
    
    @IBOutlet weak var correctAnswerText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let imagePath = "\(path)/Images/"
        
        do {
            let images = try fm.contentsOfDirectory(atPath: imagePath)
            
            imageList = images
            
        } catch {
            print("\nerror\n")
        }
        
        for imageView in imageViews
        {
            let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
            imageView.addGestureRecognizer(tapGR)
            imageView.isUserInteractionEnabled = true
        }
        assignRandomImages()
    }
    
    func assignRandomImages()
    {
        let imagePath = "\(Bundle.main.resourcePath!)/Images/"
        
        var listMix = imageList
        
        listMix.shuffle()
        
        var index = 0
        for i in imageViews
        {
            i.image = UIImage(named: imagePath + listMix[index])
            var temp = listMix[index]
            temp.removeLast(4)
            i.imageName = temp
            index += 1
        }
        getCorrectAnswer()
        
    }
    func getCorrectAnswer()
    {
        var listOfImages : [String] = []
        
        for img in imageViews
        {
            listOfImages.append(img.imageName)
        }
        
        correctAnswerText.text = listOfImages.randomElement()!
        correctAnswer = correctAnswerText.text!
        
    }
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let a = sender.view as! CaptchaImageView
            let valdity: Bool = checkAnswer(answer: a.imageName)
            
            print("\nPicked Answer: \(a.imageName)\n")
            
            if !checkAnswer(answer: a.imageName)
            {
                a.shake()
                incorrectAnswers += 1
            }
            transition(answerValidity: valdity)
        }
    }
    func checkAnswer(answer : String) -> Bool
    {
        if answer == correctAnswer
        {
            print("\nCORRECT\n")
            
            return true
        }
        else
        {
            print("\nINCORRECT\n")
            
            return false
            
        }
    }
    func transition(answerValidity : Bool)
    {
        if answerValidity && incorrectAnswers < 2
        {
            // Text Captcha Passed
            incorrectAnswers = 0
            performSegue(withIdentifier: "audioCaptcha", sender: nil)
            
        }
        else if !answerValidity && incorrectAnswers == 2
        {
            // Text Captcha Failed
            incorrectAnswers = 0
            performSegue(withIdentifier: "tooWrong", sender: nil)
        }
        else
        {
            // First Attempt Failed
            assignRandomImages()
        }
    }
    func animation()
    {
        
    }
    
}
