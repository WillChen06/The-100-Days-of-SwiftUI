//
//  AddressView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/10.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.cupcake.name)
                TextField("Street address", text: $order.cupcake.streetAddress)
                TextField("City", text: $order.cupcake.city)
                TextField("Zip", text: $order.cupcake.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.cupcake.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
