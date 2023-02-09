//
//  createAccountViewController.swift
//  Voluntracker
//
//  Created by Iyer, Eshan R on 1/24/23.
//

import UIKit

class createAccountViewController: UIViewController {
    let defaults = UserDefaults.standard
    var currentUser : [String:String] = [:]
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmation: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        password.isHidden = true
        confirmation.isHidden = true
        passwordLabel.isHidden = true
        
        assignbackground()
    }
    
    @IBAction func passwordEntered(_ sender: Any) {
        confirmation.isHidden = false
        
        var users = defaults.object(forKey: "Users") as? [String:String] ?? [:]
        
        users[username.text!] = password.text!
        
        defaults.set(users, forKey: "Users")
        
        
        username.text = ""
        password.text = ""
        
    }
    @IBAction func usernameEntered(_ sender: Any) {
        
        password.isHidden = false
        passwordLabel.isHidden = false
        
        var users = defaults.object(forKey: "Users") as? [String:String] ?? [:]
        users[username.text!] = ""
        defaults.set(users, forKey: "Users")
        
        
    }
    func assignbackground(){
        let background = UIImage(named: "account-background.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }}
