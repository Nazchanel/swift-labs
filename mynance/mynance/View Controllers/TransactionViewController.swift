//
//  ViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/25/23.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        
        var content = cell.defaultContentConfiguration()
        content.text = "Ur Mother"
        content.secondaryText = "Test"
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
   
       }
    
    
    
    
}

