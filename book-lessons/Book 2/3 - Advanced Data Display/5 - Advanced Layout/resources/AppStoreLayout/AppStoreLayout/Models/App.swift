
import UIKit

struct App: Hashable {
    
    let promotedHeadline: String?
    
    let title: String
    let subtitle: String
    let price: Double?
    var formattedPrice: String {
        if let price = price {
            guard let localCurrencyCode = Locale.autoupdatingCurrent.currencyCode else {
                return String(price)
            }
            return price.formatted(.currency(code: localCurrencyCode))
        } else {
            return "GET"
        }
    }
    
    let color = UIColor.random
}

