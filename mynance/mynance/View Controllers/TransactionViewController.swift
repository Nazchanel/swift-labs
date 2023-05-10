//
//  ViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/25/23.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var transactionList : [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        resetUserDefaults()
        
        print("View Loaded")
        
        print("Initial Transaction List: \(transactionList)")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = UserDefaults.standard.data(forKey: "Transactions") {
            let acct = try! JSONDecoder().decode([Transaction].self, from: data)
            transactionList = acct
            
            print("\n\nRow Count: \(transactionList.count)\n\n\n")
            return transactionList.count
        }
        else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? PurchaseTableViewCell
        
//        cell?.update(transaction: self.transactionList[ibde])
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        tableView.reloadData()
        if let data = UserDefaults.standard.data(forKey: "Transactions") {
            let acct = try! JSONDecoder().decode([Transaction].self, from: data)
            transactionList = acct
            
            print("\n\n\nUnwinded Count: \(transactionList.count)\n\n\n")
        }
        else{
            print("unwind failed")
        }
        
            
       }
    func resetUserDefaults() {
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach{ key in
                defaults.removeObject(forKey: key)
            }
        }
    
    
    
    
    
}

