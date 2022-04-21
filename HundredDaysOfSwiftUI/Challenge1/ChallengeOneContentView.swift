//
//  ChallengeOneContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/12.
//

import SwiftUI

struct ChallengeOneContentView: View {
    @State private var currentType = "Temperature"
    @State private var userInput: Double = 0.0
    @State private var inputConversion: UnitLength = .meters
    @State private var outputConversion: UnitLength = .kilometers
    
    
    @FocusState private var inputFocus: Bool
    
    let lengthConversions: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    var result: Double {
        let inputMeasurment = Measurement(value: userInput, unit: inputConversion)
        let output = inputMeasurment.converted(to: outputConversion)
        return output.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Length conversion", selection: $inputConversion) {
                        ForEach(lengthConversions, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input conversion")
                }
                
                Section {
                    Picker("Length conversion", selection: $outputConversion) {
                        ForEach(lengthConversions, id: \.self) {
                            Text($0.symbol)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output conversion")
                }
                
                Section {
                    TextField("Input", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFocus)
                } header: {
                    Text("Input")
                }
                
                Section {
                    Text(result, format: .number)
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputFocus = false
                    }
                }
            }
        }
    }
}

struct ChallengeOneContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeOneContentView()
    }
}
