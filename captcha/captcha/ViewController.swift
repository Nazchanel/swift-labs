//
//  ViewController.swift
//  captcha
//
//  Created by Iyer, Eshan R on 3/20/23.
//

import UIKit

var imageList : [String] = []

var soundList : [String] = []

class ViewController: UIViewController {
    @IBOutlet var imageViews: [CaptchaImageView]!
    
    override func viewDidLoad() {
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
        
        assignRandomImages()
        super.viewDidLoad()
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
            
            index += 1
        }
    }
}

