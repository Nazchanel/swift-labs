//
//  settings.swift
//  Wordle
//
//  Created by Iyer, Eshan R on 4/17/23.
//

import UIKit

class settings: UIViewController {
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func darkModeSwitched(_ sender: UISwitch) {
        
        
        let scenes         = UIApplication.shared.connectedScenes
        let windowScene    = scenes.first as? UIWindowScene
        let window         = windowScene?.windows.first
        let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ?              UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
        
        if interfaceStyle == .dark {
            window?.overrideUserInterfaceStyle = .light
        } else {
            window?.overrideUserInterfaceStyle = .dark
        }
        
    }
    
}

