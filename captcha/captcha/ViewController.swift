//
//  ViewController.swift
//  captcha
//
//  Created by Iyer, Eshan R on 3/20/23.
//

import UIKit

var imageList : [String] = []

var soundList : [String] = []

var correctAnswer : String = ""

class ViewController: UIViewController {
    @IBOutlet var imageViews: [CaptchaImageView]!
    
    @IBOutlet weak var correctAnswerText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let soundPath = "\(path)/Sounds/"
        
        let imagePath = "\(path)/Images/"
        
        
        do {
            let sounds = try fm.contentsOfDirectory(atPath: soundPath)
            let images = try fm.contentsOfDirectory(atPath: imagePath)
            
            imageList = images
            soundList = sounds
            
        } catch {
            print("error")
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
            i.imageName = listMix[index]
            index += 1
        }
        correctAnswerText.text = getCorrectAnswer()
        
    }
    func getCorrectAnswer() -> String
    {
        var listOfImages : [String] = []
        
        for img in imageViews
        {
            listOfImages.append(img.imageName)
        }
        return listOfImages.randomElement()!
        
    }
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
            print(sender.view as! CaptchaImageView)
        }
    }
}
