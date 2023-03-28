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
            print("\nerror\n")
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
        for i in answerChoiceButtons
        {
        }
    }
    
    
    
}
