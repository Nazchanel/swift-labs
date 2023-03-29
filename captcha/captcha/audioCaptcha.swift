//
//  audioCaptcha.swift
//  captcha
//
//  Created by Iyer, Eshan R on 3/24/23.
//

import UIKit
import AVFoundation

var soundList : [String] = []
var soundNameList : [String] = []
var currentAnswer : String = ""

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
        for i in soundList
        {
            var j : String = i
            var index = j.firstIndex(of: "_")!
            j = j.substring(from: index)
            index = j.firstIndex(of: ".")!
            j = j.substring(to: index)
            j.removeFirst()
            
            soundNameList.append(j)
        }
        for i in 0...3
        {
            answerChoices[i].addTarget(self, action: #selector(answerChoicePressed(_:)), for: .touchUpInside)
            answerChoices[i].backgroundColor = .blue
        }
        
    }
    
    func playSound(name:String){
        print("\nname\n")
        let url = Bundle.main.url(forResource: "/Sounds/\(name)", withExtension: "wav")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func getAudioFilePath(audioFile : String) -> String
    {
        var t = "/Sounds/\(audioFile)"
        t.removeLast(4)
        return t
    }
    func assignButtons()
    {
        var j = 1
        for i in answerChoiceButtons
        {
            let text = soundNameList[j]
            i.setTitle(text, for: .normal)
            j+=1
        }
    }
    func assignAnswer()
    {
        var lst : [String]= soundNameList
        lst.shuffle()
        
    }
       @objc func answerChoicePressed(_ sender: UIButton!){
        let pickedAnswer : String = sender.currentTitle
        
       }
    
    
    
}
