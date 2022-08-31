//
//  ViewController.swift
//  iamRich
//
//  Created by Iyer, Eshan R on 8/25/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var view1: UIView!
    @IBOutlet weak var wealthStatus: UILabel!
    
    // Image container
    @IBOutlet weak var diamond: UIImageView!
    @IBOutlet weak var wealthChanger: UIButton!
    
    // When the button is clicked, do this
    @IBAction func buttonClick(_ sender: Any) {
        
        // Changes the color of the background to a certain color
        view1.backgroundColor = UIColor(red: 0.17, green: 0.76, blue: 0.85, alpha: 1.0)
        wealthStatus.text = "I Am Poor"
        wealthStatus.textColor = .white
        
        wealthStatus.font = wealthStatus.font.withSize(60)
        
        // Changes the image container to the rock picture
        diamond.image = UIImage(named: "rock.png")

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Changes the transparency of the button so it is invisable
        wealthChanger.alpha = 0.05
        
        // Initial image is set to diamond
        diamond.image = UIImage(named: "diamond1.png")
        
    }


}

