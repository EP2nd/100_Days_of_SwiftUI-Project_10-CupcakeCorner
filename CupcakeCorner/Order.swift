//
//  Order.swift
//  CupcakeCorner
//
//  Created by Edwin Przeźwiecki Jr. on 24/01/2023.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var orderDetails = OrderDetails()
}
