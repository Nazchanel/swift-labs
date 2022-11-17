//
//  ViewController.swift
//  Squares
//
//  Created by Iyer, Eshan R on 11/17/22.
//

import UIKit

let xSquares = 10

let screenHeight : Int = 0
let screenWidth : Int = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for _ in 1...xSquares
        {
            print("hello")
            view.addSubview(Square(frame: CGRect(x:10, y:10, width: 100, height:100)))
        }
        
        
    }


}

