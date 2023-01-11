//
//  ViewController.swift
//  stopwatch
//
//  Created by Iyer, Eshan R on 1/11/23.
//

import UIKit

var time : Double = 0
var timer = Timer()

class ViewController: UIViewController {
    @IBAction func startPressed(_ sender: Any) {
    }
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction() {
        timer.invalidate()
        
        time += 0.001
        
        timerText.text = String(time)
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
}




