//
//  Transaction.swift
//  mynance
//
//  Created by Iyer, Eshan R on 5/2/23.
//

import Foundation

struct Transaction : Codable {
    let amount : String
    let date : String
    let description : String
    let category : Category
    
    enum Category : CaseIterable, Codable {
        case Income, Groceries, Utilities
        
        var description : String {
            get {
                String(describing: self)
            }
        }
        
        var imageName : String {
            switch self {
            case .Groceries : return "car.fill"
            case .Income : return "dollarsign.circle.fill"
            case .Utilities : return "bolt.fill"
            }
        }
    }
}
