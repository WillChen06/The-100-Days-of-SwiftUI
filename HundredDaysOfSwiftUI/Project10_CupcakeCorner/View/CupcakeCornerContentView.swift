//
//  CupcakeCornerContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/9.
//

import SwiftUI

struct CupcakeCornerContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.cupcake.type) {
                        ForEach(Cupcake.types.indices, id: \.self) {
                            Text(Cupcake.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.cupcake.quantity)", value: $order.cupcake.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $order.cupcake.specialRequestEnabled.animation())
                    if order.cupcake.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.cupcake.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.cupcake.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Deliver details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct CupcakeCornerContentView_Previews: PreviewProvider {
    static var previews: some View {
        CupcakeCornerContentView()
            .preferredColorScheme(.dark)
    }
}
