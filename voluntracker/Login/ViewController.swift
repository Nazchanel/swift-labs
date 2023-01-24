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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set(users, forKey: "Users")
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //        guard let sender = sender as? UIButton else {return}
        //
        //        if sender == forgotPassword
        //        {
        //            segue.destination.navigationItem.title = "Forgot Password"
        //
        //        }
        //        else if sender == forgotUsername
        //        {
        //            segue.destination.navigationItem.title = "Forgot Username"
        //        }
        //        else
        //        {
        //            segue.destination.navigationItem.title = "Welcome, \(usernameEntry.text)"
        //
        //        }
        //
    }
    func setUserDict()
    {
        let storedUsers = defaults.object(forKey: "Users") as? [String:String] ?? [:]
        
        users = storedUsers
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        setUserDict()
        
        let username = usernameEntry.text!
        let password = passwordEntry.text!
        
        print("The Username entered is \(username)\n")
        print("The Password entered is \(password)\n")
        
        if users == [:]
        {
            invalidAlert()
        }
        else
        {
            let hello = users[username]
            
            if hello == nil
            {
                invalidAlert()
            }
            else{
                let password_ = hello!
                if password_ == password
                {
                    print("Correct Login")
                }
                else
                {
                    invalidAlert()
                }
            }
            
        }
        
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotCred", sender: forgotPassword)
    }
    func invalidAlert()
    {
        let dialogMessage = UIAlertController(title: "Invalid Username or Password", message: "Please try again", preferredStyle: .alert)
        
        dialogMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in self.invalidPressed()}))
        
        self.present(dialogMessage, animated: true, completion: nil)
        
        
    }
    func invalidPressed()
    {
        return
    }
}

