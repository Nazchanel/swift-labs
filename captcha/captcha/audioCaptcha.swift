//
//  audioCaptcha.swift
//  captcha
//
//  Created by Iyer, Eshan R on 3/24/23.
//

import UIKit
import AVFoundation

var soundList : [String] = []
var currentAnswer : String = ""
var currentAnswerName : String = ""
var randomIndex : Int = 0
var incorrectAnswerCount : Int = 0

class audioCaptcha: UIViewController {
    var player: AVAudioPlayer!
    
    @IBOutlet var answerChoiceButtons: [UIButton]!
    
    @IBOutlet weak var playAudioButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let soundPath = "\(path)/Sounds/"
        
        do {
            let sounds = try fm.contentsOfDirectory(atPath: soundPath)
            soundList = sounds
            
        } catch {
            print("\nError\n")
        }
        
        
        for i in 0...3
        {
            answerChoiceButtons[i].addTarget(self, action: #selector(answerChoicePressed(_:)), for: .touchUpInside)
            answerChoiceButtons[i].backgroundColor = .blue
        }
        assignAnswer()
        assignButtons(flag: true)
        
    }
    func wavRemover(wavName : String) -> String
    {
        var j : String = wavName
        var index = j.firstIndex(of: ".")!
        j = j.substring(to: index)
        
        return j
        
    }
    func fileToName(file:String) -> String
    {
        var j : String = file
        var index = j.firstIndex(of: "_")!
        j = j.substring(from: index)
        index = j.firstIndex(of: ".")!
        j = j.substring(to: index)
        j.removeFirst()
        
        return j
        
    }
    func playSound(name:String){
        let soundDirectory = "/Sounds/\(name)"
        let url = Bundle.main.url(forResource: soundDirectory, withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func getAudioFilePath(audioFile : String) -> String
    {
        var t = "/Sounds/\(audioFile)"
        t.removeLast(4)
        return t
    }
    func assignButtons(flag:Bool)
    {
        var j = 0
        for i in answerChoiceButtons
        {
            let text = fileToName(file: soundList[j])
            i.setTitle(text, for: .normal)
            j+=1
        }
        print("\nJ value: \(j)\n")
        if !flag
        {
            soundList.removeFirst(4)
        }

        print("\nUpdated Sound List: \(soundList)\n")
    }
    func assignAnswer()
    {
        randomIndex = Int.random(in: 0 ... 3)
        correctAnswer = soundList[randomIndex]
        
    }
    @objc func answerChoicePressed(_ sender: CaptchaButton!){
        let pickedAnswer : String = sender.currentTitle!
        
        print("\nSender title: \(pickedAnswer)\n")
        print("\nCorrect Answer: \(fileToName(file: correctAnswer))\n")
        
        let validity = checkAnswer(answer: pickedAnswer)
        if !validity
        {
            sender.shake()
        }
        transition(answerValidity: validity)
        
       
        
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        playSound(name: wavRemover(wavName: correctAnswer))
    }
    func checkAnswer(answer : String) -> Bool
    {
        if answer == fileToName(file: correctAnswer)
        {
            print("\ncorrect audio pressed\n")
            return true
        }
        else
        {
            print("\nincorrect audio pressed\n")
            incorrectAnswers += 1
            return false
        }
    }
    func transition(answerValidity : Bool)
    {
        if answerValidity && incorrectAnswerCount < 2
        {
            // Text Captcha Passed
            incorrectAnswerCount = 0
            performSegue(withIdentifier: "notARobot", sender: nil)
            
        }
        else if !answerValidity && incorrectAnswerCount == 2
        {
            // Text Captcha Failed
            incorrectAnswerCount = 0
            performSegue(withIdentifier: "tooWrong", sender: nil)
        }
        else
        {
            // First Attempt Failed
            assignAnswer()
            assignButtons(flag: false)
        }
    }
}
