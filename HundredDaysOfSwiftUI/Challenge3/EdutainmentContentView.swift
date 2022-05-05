//
//  EdutainmentContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/22.
//

import SwiftUI

struct Question {
    let text: String
    let answer: String
    let row: Int
}


struct EdutainmentContentView: View {
    
    @State private var multiplicationNumber = 2
    
    @State private var randomNumber = Int.random(in: 1...12)
    
    @State private var roundCount = 5
    
    @State private var currentQuestion = 1
    
    @State private var answer = ""
    @State private var score = 0
    
    @State private var isShowingAlert = false
    
    var isFinalRound: Bool {
        roundCount == currentQuestion
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    Stepper(value: $multiplicationNumber, in: 2...12, step: 1, onEditingChanged: { isChanged in
                        resetGame()
                    }) {
                        Text("\(multiplicationNumber) multiplication table")
                    }
                    
                    Picker("Select", selection: $roundCount)  {
                        Text(5, format: .number).tag(5)
                        Text(10, format: .number).tag(10)
                        Text(20, format: .number).tag(20)
                    }
                    .onChange(of: roundCount, perform: { _ in
                        resetGame()
                    })
                    .pickerStyle(.segmented)
                }.padding()
                
                VStack(spacing: 8) {
                    Text("\(currentQuestion) / \(roundCount)")
                        .font(.title2)
                    Text("what is \(multiplicationNumber) x \(randomNumber)?")
                        .font(.largeTitle)
                }.transition(.scale)
                
                VStack {
                    TextField("Enter the answer", text: $answer, onCommit: {
                        checkAnswer()
                        if isFinalRound {
                            isShowingAlert = true
                        } else {
                            nextRound()
                        }
                    })
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                }
                .padding()
                
                Text("Your Score : \(score)")
                    .font(.largeTitle)
                Spacer()
            }
            .navigationTitle("Edutainment")
            .alert("Finish this game", isPresented: $isShowingAlert) {
                Button("NewGame") {
                    resetGame()
                }
            } message: {
                Text("Your score is \(score)")
            }
            
        }
    }
    
    func checkAnswer() {
        if Int(answer) == multiplicationNumber * randomNumber {
            score += 1
        }
        
    }
    
    func nextRound() {
        randomNumber = Int.random(in: 1...12)
        currentQuestion += 1
        answer = ""
    }
    
    func resetGame() {
        randomNumber = Int.random(in: 1...12)
        currentQuestion = 1
        answer = ""
        score = 0
    }
}

struct EdutainmentContentView_Previews: PreviewProvider {
    static var previews: some View {
        EdutainmentContentView()
    }
}
