//
//  ViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/25/23.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDataSource {
    
    var transactionList : [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("View Appeared")
        
        if let data = UserDefaults.standard.data(forKey: "Transactions") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                transactionList = try decoder.decode([Transaction].self, from: data)

            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Test", for: indexPath)
        
        
        var content = cell.defaultContentConfiguration()
        content.text = "test"
        content.secondaryText = "Test"
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
            
       }
    
    
    
    
    
}

