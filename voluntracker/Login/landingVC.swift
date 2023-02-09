//
//  landingVC.swift
//  Voluntracker
//
//  Created by Iyer, Eshan R on 1/26/23.
//

import UIKit

var goalHours: Double = 0
var currentHours: Double = 0

let defaults = UserDefaults.standard



class landingVC: UIViewController {
    @IBOutlet weak var currentHoursLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var helpMessage: UILabel!
    @IBOutlet weak var congratulationsMessage: UILabel!
    
    @IBOutlet weak var hourAddButton: UIButton!
    @IBOutlet weak var removeHour: UIButton!
    
    @IBOutlet weak var hoursEntry: UITextField!
    
    // Setting user defaults contents to a local variable
    var currentHoursStorage: [String: Double] = defaults.object(forKey: "Current Hours") as? [String:Double] ?? [:]
    var goalHoursStorage: [String: Double] = defaults.object(forKey: "Goal Hours") as? [String:Double] ?? [:]
    
    var username : String = ""
    
    var userExists : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializes the values to original
        currentHours = 0
        goalHours = 0
        
        currentHoursLabel.text = "\(currentHours) out of \(goalHours)"
        
        assignbackground()
        
        // Sets values of goal hours to stored value if a user is there
        for(user,gh) in goalHoursStorage
        {
            if username == user{
                goalHours = gh
                userExists = true
            }
            else
            {
                userExists = false
            }
        }
        
        // Sets values of current hours to stored value if a user is there
        for(user,ch) in currentHoursStorage
            
        {
            if username == user
            {
                currentHours = ch
                userExists = true
            }
            else
            {
                userExists = false
            }
        }
        
        // Initializes all the values to their initial values
        welcomeLabel.text! = "Hello \(username)"
        
        progressLabel.text! = "\(username)'s progress"
        progressLabel.isHidden = true
        
        currentHoursLabel.text = ""
        currentHoursLabel.isHidden = true
        
        welcomeLabel.isHidden = false
        helpMessage.isHidden = false
        hoursEntry.isHidden = false
        
        hourAddButton.isHidden = true
        removeHour.isHidden = true
        congratulationsMessage.isHidden = true
        
        // Loads user if user exists
        if userExists
        {
            loadingUser()
        }
        
        
        
        
    }
    @IBAction func incrementHour(_ sender: Any) {
        if currentHours + 1 == goalHours
        {
            currentHours += 1
            
            storeCurrentHours()
            
            currentHoursLabel.text = "\(currentHours) out of \(goalHours)"
            
            congratulationsMessage.isHidden = false
        }
        else if currentHours < goalHours
        {
            congratulationsMessage.isHidden = true
            currentHours += 1
            
            storeCurrentHours()
            
            currentHoursLabel.text = "\(currentHours) out of \(goalHours)"
        }
        
    }
    
    @IBAction func removeHour(_ sender: Any) {
        if currentHours - 1 < 0
        {
            return
        }
        else
        {
            congratulationsMessage.isHidden = true
            
            currentHours -= 1
            
            currentHoursLabel.text = "\(currentHours) out of \(goalHours)"
        }
        
    }
    @IBAction func hoursEntered(_ sender: Any) {
        goalHours = Double(hoursEntry.text!) ?? 0.0
        
        storeGoalHours()
        
        welcomeLabel.isHidden = true
        helpMessage.isHidden = true
        hoursEntry.isHidden = true
        
        currentHoursLabel.isHidden = false
        progressLabel.isHidden = false
        hourAddButton.isHidden = false
        removeHour.isHidden = false
        
        currentHoursLabel.text = "\(currentHours) out of \(goalHours)"
    }
    func storeGoalHours()
    {
        var users = defaults.object(forKey: "Goal Hours") as? [String:Double] ?? [:]
        users[username] = goalHours
        
        defaults.set(users, forKey: "Goal Hours")
        
    }
    func storeCurrentHours()
    {
        var users = defaults.object(forKey: "Current Hours") as? [String:Double] ?? [:]
        users[username] = currentHours
        
        defaults.set(users, forKey: "Current Hours")
        
    }
    func loadingUser()
    {
        // Initialization
        welcomeLabel.isHidden = true
        helpMessage.isHidden = true
        hoursEntry.isHidden = true
        
        currentHoursLabel.isHidden = false
        progressLabel.isHidden = false
        hourAddButton.isHidden = false
        removeHour.isHidden = false
        
        currentHoursLabel.text = "\(currentHours) out of \(goalHours)"
    }
    func assignbackground(){
        let background = UIImage(named: "login-background.jpg")
        
        // Settings to make the background image display nicely
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
