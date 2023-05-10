//
//  PurchaseTableViewCell.swift
//  mynance
//
//  Created by Iyer, Eshan R on 4/28/23.
//

import UIKit

class PurchaseTableViewCell: UITableViewCell {

    
    @IBOutlet var img: UIImageView!
    @IBOutlet var transType: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var transDescription: UILabel!
    @IBOutlet var amount: UILabel!
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(transaction: Transaction)
    {
        self.configureImage(transaction: transaction)
        
        self.transDescription.text = transaction.description
        self.transType.text = transaction.category.description
        self.date.text = transaction.date
        self.amount.text = transaction.amount
    }
    private func configureImage(transaction : Transaction)
    {
        self.img.image = UIImage(systemName: transaction.category.imageName)
    }
    

}
