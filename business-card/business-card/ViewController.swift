//
//  ViewController.swift
//  business-card
//
//  Created by Iyer, Eshan R on 10/20/22.
//




import UIKit

class ViewController: UIViewController {
    var picture = UIImageView()
    let name = UILabel()
    let jobTitle = UILabel()
    let contactHider = UIButton()
    let contactOne = UILabel()
    let contactTwo = UILabel()
    
    var screenWidth : Double = UIScreen.main.bounds.width
    var screenHeight: Double = UIScreen.main.bounds.height
    
    var currentState = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        
        self.configureJobTitle()
        self.configureProfilePic()
        self.configureNameText()
        self.configureContactHider()
        self.configureContacts()
        
        contactOne.isHidden = true
        contactTwo.isHidden = true
        
        self.view = view
    }
    func configureProfilePic() // Adds a picture of my face
    {
        picture.image = UIImage(named: "face.jpg")
        picture.frame = CGRect(x: screenWidth * 0.25, y: screenHeight/4, width: 200, height: 200)
        picture.layer.cornerRadius = picture.frame.width/2
        picture.layer.masksToBounds = true
        picture.layer.borderWidth = 4
        picture.layer.borderColor = UIColor.white.cgColor
        view.addSubview(picture)
        
    }
    func configureNameText() // Adds my name
    {
        name.frame = CGRect(x: screenWidth * 0.03, y: screenHeight/3.5, width: 400, height: 400)
        name.textAlignment = .center
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 40)
        name.text = "Eshan Iyer"
        
        view.addSubview(name)
    }
    func configureJobTitle() // Adds my job title
    {
        jobTitle.frame = CGRect(x: screenWidth * 0.03, y: screenHeight/3, width: 400, height: 400)
        jobTitle.textAlignment = .center
        jobTitle.textColor = .white
        jobTitle.font = UIFont.systemFont(ofSize: 25)
        jobTitle.text = "Machine Learning Enthusiast"
        
        view.addSubview(jobTitle)
        
    }
    func configureContactHider() // Adds button that allows you to hide the contact info
    {
        contactHider.frame = CGRect(x: screenWidth * 0.03, y: screenHeight/2.7, width: 400, height: 400)
        contactHider.setTitle("Tap to show contact info", for: .normal)
        contactHider.titleLabel?.textAlignment = .center
        contactHider.titleLabel?.textColor = UIColor.white
        contactHider.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        view.addSubview(contactHider)
    }
    func configureContacts() // Adds the contacts themselves
    {
        contactOne.frame = CGRect(x: screenWidth * 0.03, y: screenHeight/1.59, width: 400, height: 25)
        contactOne.textAlignment = .center
        contactOne.text = "Phone: +1 (972) 439-4254"
        contactOne.backgroundColor = .white
        contactOne.layer.cornerRadius = 10
        contactOne.layer.masksToBounds = true
        
        contactTwo.frame = CGRect(x: screenWidth * 0.03, y: screenHeight/1.5, width: 400, height: 25)
        contactTwo.textAlignment = .center
        contactTwo.text = "Email: admin@eshaniyer.tech"
        contactTwo.backgroundColor = .white
        contactTwo.layer.cornerRadius = 10
        contactTwo.layer.masksToBounds = true
        
        view.addSubview(contactOne)
        view.addSubview(contactTwo)
    }
    @objc func buttonPressed(_ sender: UIButton!) { // Function that is called when the button is pressed
        
        if currentState == false
        {
            contactHider.setTitle("Tap to hide contact info", for: .normal)
            contactOne.isHidden = false
            contactTwo.isHidden = false
            currentState = true
        }
        else
        {
            contactHider.setTitle("Tap to show contact info", for: .normal)
            
            contactOne.isHidden = true
            contactTwo.isHidden = true
            
            currentState = false
        }
        
    }
}
