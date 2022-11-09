//
//  ViewController.swift
//  xylophone
//
//  Created by Iyer, Eshan R on 11/7/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cPressed(_ sender: UIButton) {
        playC()
    }
    @IBAction func dPressed(_ sender: UIButton) {
        playD()
    }
    @IBAction func ePressed(_ sender: UIButton) {
        playE()
    }
    @IBAction func fPressed(_ sender: UIButton) {
        playF()
    }
    @IBAction func gPressed(_ sender: UIButton) {
        playG()
    }
    @IBAction func aPressed(_ sender: UIButton) {
        playA()
    }
    @IBAction func bPressed(_ sender: UIButton) {
        playB()
    }
    
    func playC(){
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playD(){
        let url = Bundle.main.url(forResource: "D", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playE(){
        let url = Bundle.main.url(forResource: "E", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playF(){
        let url = Bundle.main.url(forResource: "F", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playG(){
        let url = Bundle.main.url(forResource: "G", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playA(){
        let url = Bundle.main.url(forResource: "A", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playB(){
        let url = Bundle.main.url(forResource: "B", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

