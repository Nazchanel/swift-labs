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
    
    
    var username : String = ""
    
    var currentHoursStorage: [String: Double] = defaults.object(forKey: "Current Hours") as? [String:Double] ?? [:]
    var goalHoursStorage: [String: Double] = defaults.object(forKey: "Goal Hours") as? [String:Double] ?? [:]
    
    override func viewDidLoad() {
        for(user,pwd) in currentHoursStorage
        {
            if user == username
            {
                loadingUser()
            }
        }
        
        print("\n")
        
        for(user,pwd) in goalHoursStorage
        {
            print("Username?: \(user)\nGoal Hours?: \(pwd)\n")
        }
        
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
        
        super.viewDidLoad()
        
    }
    @IBAction func incrementHour(_ sender: Any) {
        print("\nCurrent Hours: \(currentHours)\nGoalHours: \(goalHours)\n")
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
        
    }
}
