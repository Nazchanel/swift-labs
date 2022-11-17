//
//  square.swift
//  Squares
//
//  Created by Iyer, Eshan R on 11/17/22.
//

import UIKit

class Square: UIView {
    var location = CGPoint(x: 0, y: 0)
    
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addGestureRecognizer(UIGestureRecognizer(target: Square(), action: #selector(moveSquare(_:))))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moveSquare(_ recognizer: UIPanGestureRecognizer)
    {
        let translation = recognizer.translation(in: recognizer.view?.superview)
        
        self.center = translation
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        superview?.bringSubviewToFront(self)
        
        location = self.center
        
    }
}
