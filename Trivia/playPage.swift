//
//  playPage.swift
//  Trivia
//
//  Created by Iyer, Eshan R on 2/23/23.
//

import UIKit

class playPage: UIViewController {
    var questionNumberSelected : Int = 0
    var categorySelected : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Question Number Selected: \(questionNumberSelected)")
        print("Category Selected: \(categorySelected)")
        
    }

}
