//
//  ViewController.swift
//  Login
//
//  Created by Iyer, Eshan R on 1/13/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var forgotUsername: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    let defaults = UserDefaults.standard
    
    var users: [String: String] = [:]
    
    var loggedInUser : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loginToLanding"
        {
            let landingVC = segue.destination as! landingVC
            landingVC.username = loggedInUser
            
        }
        
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        users = defaults.object(forKey: "Users") as? [String:String] ?? [:]
        
        // Entered credentials
        let username = usernameEntry.text!
        let password = passwordEntry.text!
        
        var foundUser : Bool = false
        
        
        
        for(user,pwd) in users
        {
            if user == username && pwd == password
            {
                loggedInUser = user
                foundUser = true
            }
        }
        if foundUser
        {
            usernameEntry.text = ""
            passwordEntry.text = ""
            
            performSegue(withIdentifier: "loginToLanding", sender:loginButton)
            
        }
        else
        {
            usernameEntry.text = ""
            passwordEntry.text = ""
            
            invalidAlert()
        }
        
        
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotCred", sender: forgotPassword)
    }
    func invalidAlert()
    {
        let dialogMessage = UIAlertController(title: "Invalid Username or Password", message: "Please try again", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.invalidPressed()}))
        
        self.present(dialogMessage, animated: true, completion: nil)
        
        
    }
    func invalidPressed()
    {
        return
    }
}

