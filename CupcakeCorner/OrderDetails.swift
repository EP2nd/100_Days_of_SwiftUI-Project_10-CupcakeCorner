//
//  OrderDetails.swift
//  CupcakeCorner
//
//  Created by Edwin Przeźwiecki Jr. on 25/01/2023.
//

import Foundation

struct OrderDetails: Codable, Equatable, Identifiable {
    
    var id = UUID()
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        /// Challenge 1:
        if name.isTrulyEmpty || streetAddress.isTrulyEmpty || city.isTrulyEmpty || zip.isTrulyEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        /// 2$ per cake:
        var cost = Double(quantity) * 2
        
        /// Complicated cakes cost more:
        cost += (Double(type / 2))
        
        /// $1/cake for extra frosting:
        if extraFrosting {
            cost += Double(quantity)
        }
        
        /// $0.50/cake for sprinkles:
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
