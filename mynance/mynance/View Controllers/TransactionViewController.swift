//
//  ViewController.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/25/23.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var transactionList : [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //        Execute to reset the User Defaults to clear the stored transactions
        //        resetUserDefaults()
        
        print("View Loaded")
        
        print("Initial Transaction List: \(transactionList)")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
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
        
        cell?.update(transaction: self.transactionList[indexPath.row])
        
        reloadBalance()
        
        
        return cell!
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
    func reloadBalance(){
        var totalBalance : Double = 0
        for i in transactionList
        {
            let transactionType = i.category.description
            
            if transactionType == "Income"{
                totalBalance += Double(i.amount)!
            }
            else
            {
                totalBalance -= Double(i.amount)!
            }
            
        }
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        
        let priceString = currencyFormatter.string(from: NSNumber(value: totalBalance))!
        
        balanceLabel.text = priceString
    }
    
    
    
    
    
}

