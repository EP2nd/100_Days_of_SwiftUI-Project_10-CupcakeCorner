//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Edwin Przeźwiecki Jr. on 23/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = SharedOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type:", selection: $order.orderDetails.type) {
                        ForEach(SharedOrder.types.indices) {
                            Text(SharedOrder.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.orderDetails.quantity)", value: $order.orderDetails.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.orderDetails.specialRequestEnabled.animation())
                    
                    if order.orderDetails.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.orderDetails.extraFrosting)
                        
                        Toggle("Add extra springkles", isOn: $order.orderDetails.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
