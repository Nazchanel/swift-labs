//
//  ViewController.swift
//  Voluntracker
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
        
        // Resets User Defaults
        // resetDefaults()
        
        // Color of the placeholder text inside the text field
        let placeholderColor : UIColor = #colorLiteral(red: 0.6719486713, green: 0.6719486713, blue: 0.6719486713, alpha: 1)
        
        usernameEntry.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        passwordEntry.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        
        forgotPassword.layer.cornerRadius = 10
        forgotUsername.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
        
        assignbackground()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loginToLanding"
        {
            let landingVC = segue.destination as! landingVC
            
            // Gives the username of the logged in user to the landing VC
            landingVC.username = loggedInUser
            
        }
        
    }
    @IBAction func passwordFinished(_ sender: Any) {
        loginPressed(loginButton)
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
    // Filler Function for pressing the ok button on the invalid message
    func invalidPressed()
    {
        return
    }
    func assignbackground(){
        let background = UIImage(named: "login-background.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach{ key in
            defaults.removeObject(forKey: key)
        }
    }
}

