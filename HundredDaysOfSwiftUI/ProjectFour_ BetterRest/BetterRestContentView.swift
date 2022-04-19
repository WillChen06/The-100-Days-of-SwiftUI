//
//  BetterRestContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/19.
//

import CoreML
import SwiftUI

struct BetterRestContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var coffeePickerIndex = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var recommendedBedTime: String {
        if let date = calculateBedTime() {
            return date.formatted(date: .omitted, time: .shortened)
        }
        return "Something goes wrong."
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
                    Picker(selection: $coffeePickerIndex) {
                        ForEach(0..<20) { num in
                            Text((num + 1) == 1 ? "1 cup" : "\(num + 1) cups")
                        }
                    } label: {
                        Text("Coffee")
                    }
                }
                
                VStack {
                    Text("Your recommended bedtime")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(recommendedBedTime)
                        .font(.largeTitle)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .listRowInsets(EdgeInsets())
                .background(Color(UIColor.systemGroupedBackground))
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedTime() -> Date? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeePickerIndex + 1))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
        } catch {
            return nil
        }
    }
}

struct BetterRestContentView_Previews: PreviewProvider {
    static var previews: some View {
        BetterRestContentView()
    }
}
