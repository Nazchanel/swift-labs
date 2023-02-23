//
//  ViewController.swift
//  Trivia
//
//  Created by Iyer, Eshan R on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var questionNumberPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var categoryData: [String] = [String]()
    var questionNumbersData: [String] = [String]()
    
    var amountOfQuestions : Int = 0
    var questionNumberSelected : Int = 0
    
    var categorySelected : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (type,question ) in Trivia.triviaQuestions {
            categoryData.append(type)
            amountOfQuestions = question.count
            
        }
        
        var i = 1
        while i <= amountOfQuestions
        {
            questionNumbersData.append(String(i))
            i+=1
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        // Connect data:
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        self.questionNumberPicker.delegate = self
        self.questionNumberPicker.dataSource = self
        
        // Input the data into the array
        
        
        

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == questionNumberPicker
        {
            return questionNumbersData.count
        }
        else
        {
            return categoryData.count
        }
        
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == questionNumberPicker
        {
            return questionNumbersData[row]
        }
        else
        {
            return categoryData[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
       {
           
           if pickerView == questionNumberPicker
           {
               print("question number picked")
               questionNumberSelected = Int(questionNumbersData[row])!
               
               let secondTab = (self.tabBarController?.viewControllers![1] as! playPage)
               secondTab.questionNumberSelected = questionNumberSelected
               
           }
           else
           {
               print("category selected")
               
               categorySelected = categoryData[row]
               
               let secondTab = (self.tabBarController?.viewControllers![1] as! playPage)
               secondTab.categorySelected = categorySelected
           }
        }
    
}

