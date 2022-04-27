//
//  iExpenseContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/26.
//

import SwiftUI

struct AmountStyle: ViewModifier {
    let amount: Double
    
    func body(content: Content) -> some View {
        var foregroundColor = Color.black
        switch amount {
        case ..<10:
            foregroundColor = .yellow
        case ..<100:
            foregroundColor = .green
        case 100...:
            foregroundColor = .red
        default:
            foregroundColor = .black
        }
        return content
            .foregroundColor(foregroundColor)
    }
}

extension View {
    func setAmountStyle(_ amount: Double) -> some View {
        modifier(AmountStyle(amount: amount))
    }
}

struct iExpenseContentView: View {
    @StateObject var personalExpenses = PersonalExpenses()
    @StateObject var bussinessExpenses = BussinessExpenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal")) {
                    ForEach(personalExpenses.items, id: \.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .setAmountStyle(item.amount)
                        }
                        
                    }.onDelete(perform: removePersonal)
                }
                
                Section(header: Text("Bussiness")) {
                    ForEach(bussinessExpenses.items, id: \.id) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .setAmountStyle(item.amount)
                        }
                        
                    }.onDelete(perform: removeBussiness)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(personalExpenses: personalExpenses, bussinessExpenses: bussinessExpenses)
            }
        }
    }
    
    func removePersonal(at offsets: IndexSet) {
        personalExpenses.items.remove(atOffsets: offsets)
    }
    
    func removeBussiness(at offsets: IndexSet) {
        bussinessExpenses.items.remove(atOffsets: offsets)
    }
}

struct iExpenseContentView_Previews: PreviewProvider {
    static var previews: some View {
        iExpenseContentView()
    }
}
