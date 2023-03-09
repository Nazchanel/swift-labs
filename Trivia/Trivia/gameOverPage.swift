//
//  gameOverPage.swift
//  Trivia
//
//  Created by Iyer, Eshan R on 3/9/23.
//

import UIKit

class gameOverPage: UIViewController {
    var score : Double = 0
    var totalQuestions : Double = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        
        scoreLabel.text = "You got \(Int(score)) out of \(Int(totalQuestions)) questions correct"

    }
    override func viewDidAppear(_ animated: Bool) {
        scoreLabel.text = "You got \(Int(score)) out of \(Int(totalQuestions)) questions correct"

    }
    override func viewDidDisappear(_ animated: Bool) {
        score = 0
        totalQuestions = 0
    }
    func assignbackground()
    {
        let background = UIImage(named: "road.jpg")
        
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
