//
//  AddView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/26.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var personalExpenses: PersonalExpenses
    @ObservedObject var bussinessExpenses: BussinessExpenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    
    let types = ["Bussiness", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    if type == "Personal" {
                        personalExpenses.items.append(item)
                    } else if type == "Bussiness" {
                        bussinessExpenses.items.append(item)
                    }
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(personalExpenses: PersonalExpenses(), bussinessExpenses: BussinessExpenses())
    }
}
