//
//  ViewController.swift
//  business-card
//
//  Created by Iyer, Eshan R on 10/20/22.
//




import UIKit

class ViewController: UIViewController {
    var picture = UIImageView()
    var screenWidth : Double = 0
    var screenHeight : Double = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenBounds: CGRect = UIScreen.main.bounds
        
        view.backgroundColor = UIColor.blue
        
        screenWidth  = screenBounds.width
        screenHeight = screenBounds.height
        print("The Screen Width is \(screenWidth)")
        print("The Screen Height is \(screenHeight)")
        
        picture.image = UIImage(named: "face.jpg")
        picture.frame = CGRect(x: screenWidth * 0.25, y: screenHeight/4, width: 200, height: 200)
        picture.layer.cornerRadius = picture.frame.width/2
        picture.layer.masksToBounds = true
        picture.layer.borderWidth = 4
        picture.layer.borderColor = UIColor.white.cgColor
        view.addSubview(picture)
        
        let name = UILabel(frame: CGRect(x: screenWidth * 0.03, y: screenHeight/3.5, width: 400, height: 400))
        name.textAlignment = .center
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 40)
        name.text = "Eshan Iyer"
        view.addSubview(name)
        
        let title = UILabel(frame: CGRect(x: screenWidth * 0.03, y: screenHeight/3, width: 400, height: 400))
        title.textAlignment = .center
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 25)
        title.text = "Machine Learning Enthusiast"
        view.addSubview(title)
        
        let contactHider = UIButton(frame: CGRect(x: screenWidth * 0.03, y: screenHeight/3, width: 400, height: 400))
        contactHider.setTitle("test", for: .normal)
        contactHider.titleLabel?.textAlignment = .center
//        contactHider.titleLabel?.textColor = UIColor
        
        view.addSubview(contactHider)
        
        self.view = view
    }


}

