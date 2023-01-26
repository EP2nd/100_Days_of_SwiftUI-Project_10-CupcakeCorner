//
//  Order.swift
//  CupcakeCorner
//
//  Created by Edwin Przeźwiecki Jr. on 24/01/2023.
//

import SwiftUI

//MARK: - Bonus advanced alternative:
/// To let us use references by writing e.g. *order.price* instead of *order.orderDetails.price* etc., we may use:
/// *Dynamic Member Lookup & Key Parts*

//@dynamicMemberLookup

class SharedOrder: ObservableObject {
    
    @Published var orderDetails = Order()
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
//    subscript<T>(dynamicMember keyPath: KeyPath<Order, T>) -> T {
//        orderDetails[keyPath: keyPath]
//    }
//
//    subscript<T>(dynamicMember keyPath: WritableKeyPath<Order, T>) -> T {
//        get {
//            orderDetails[keyPath: keyPath]
//        }
//
//        set {
//            orderDetails[keyPath: keyPath] = newValue
//        }
//    }
}

struct Order: Codable {
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
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
