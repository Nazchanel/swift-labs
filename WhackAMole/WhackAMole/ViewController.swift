import UIKit

class ViewController: UIViewController {
    
    var screenWidth  = 0
    var screenHeight = 0
    
    
    var lblHorizontal = UILabel()
    
    var lblBackground = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth  = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        
        print("Screen width = \(screenWidth), screen height = \(screenHeight)")
        
        
        
        // horizontal label, full screen width
        lblHorizontal.frame = CGRect(x: 20, y: 100, width: screenWidth / 10, height: 50)
        lblHorizontal.backgroundColor = UIColor.yellow
        
        lblHorizontal.text = "0"
        
        
        lblHorizontal.frame = CGRect(x:0, y: 0, width: screenHeight-10, height: screenWidth-10)
        lblBackground.backgroundColor = UIColor.green
        
        view.addSubview(lblHorizontal)
        

    }
}
