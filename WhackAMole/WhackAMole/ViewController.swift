import UIKit

class ViewController: UIViewController {
    var score = 0
    
    var gameOver = UILabel()
    
    var timerCount = 0
    var screenWidth  = 0
    var screenHeight = 0
    
    var timer = Timer()
    var btnTimer = UIButton()
    
    var lblHorizontal = UILabel()
    
    var lblBackground = UILabel()
    
    // Mole
    var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Gets the screen size
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth  = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        print("Screen width = \(screenWidth), screen height = \(screenHeight)")
        
        // Mole
        btn.frame = CGRect(x: 200, y: 400, width: 100, height: 50)
        btn.backgroundColor = UIColor.brown
        btn.setTitle("Hit me!", for: .normal)
        btn.addTarget(self, action: #selector(hitMe(_:)), for: .touchUpInside)
                
        
        // horizontal label, full screen width
        lblHorizontal.frame = CGRect(x: 20, y: 100, width: screenWidth / 10, height: 50)
        lblHorizontal.backgroundColor = UIColor.yellow
        
        lblHorizontal.text = "0"
        lblHorizontal.font = UIFont.systemFont(ofSize: 20)
        
        lblBackground.frame = CGRect(x:(screenWidth/2)-((screenWidth-10)/2), y: (screenHeight/2)-((screenHeight-10)/2), width: screenWidth-10, height: screenHeight-10)
        
        lblBackground.backgroundColor = UIColor.green
        
        // Adds everything to the screen
        view.addSubview(lblBackground)
        view.addSubview(lblHorizontal)
        view.addSubview(btn)
        self.view = view
        
    timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    @objc func hitMe(_ sender : UIButton!) {
        print("Got 'em!!")
        btn.frame.origin = CGPoint(x: Int.random(in:0...(screenWidth - 75)), y: Int.random(in: 50...(screenHeight-75)))
        
        // Stops timer
        timer.invalidate()
        
        // Increments the score
        score += 1
        
        lblHorizontal.text = String(score)
        
        // Restarts Timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)

        
//        btn.frame = CGRect(x: 10, y: 10, width: 40, height: 40)
        
//        Int.random(in: 1...99)
    }
    @objc func timerFunction(_ sender: UIButton!) {
        print("Timer fired!!")
//        if (timerCount == 5)
//        {
//            btn.removeFromSuperview()
//            gameOver.text = "Game Over!"
//            gameOver.font = UIFont.systemFont(ofSize: 40)
//            gameOver.frame = CGRect(x:0, y: 0, width: 300, height: 60)
//            gameOver.backgroundColor = .red
//
//            view.addSubview(gameOver)
//
//
//        }
        timerCount+=1
        
        // Places button at random location
        btn.frame.origin = CGPoint(x: Int.random(in:0...(screenWidth - 75)), y: Int.random(in: 50...(screenHeight-75)))
        
        }

}
