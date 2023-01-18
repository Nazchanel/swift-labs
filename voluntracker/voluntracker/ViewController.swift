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
    
    let actualUsername: String = "bobMan123"
    let actualPassword: String = "boblikesPizza!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgotPassword
        {
            segue.destination.navigationItem.title = "Forgot Password"
            
        }
        else if sender == forgotUsername
        {
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else
        {
            segue.destination.navigationItem.title = "Welcome, \(usernameEntry.text)"

        }
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let username = usernameEntry.text!
        let password = passwordEntry.text!
        
        print("The Username entered is \(username)")
        print("The Password entered is \(password)")
        
        if username == actualUsername && password == actualPassword
        {
            performSegue(withIdentifier: "loginToLanding", sender: loginButton)
            
        }
        
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotCred", sender: forgotPassword)
    }
}

