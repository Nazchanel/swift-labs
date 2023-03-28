//
//  File.swift
//  captcha
//
//  Created by Iyer, Eshan R on 3/22/23.
//

import UIKit

@IBDesignable

class CaptchaButton : UIButton
{
    var buttonName : String = ""
    
    func shake() {
            let animation = CABasicAnimation(keyPath: "position")
            
            animation.duration     = 0.05
            animation.repeatCount  = 3
            animation.autoreverses = true
            animation.fromValue    = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
            animation.toValue      = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
            
            self.layer.add(animation, forKey: "position")
        }
}
