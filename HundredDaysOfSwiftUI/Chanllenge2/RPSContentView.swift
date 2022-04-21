//
//  RPSContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/18.
//

import SwiftUI

struct RPSContentView: View {
    @State private var systemIndex: Int = Int.random(in: 0..<3)
    @State private var playerShouldWin = Bool.random()
    
    @State private var score: Int = 0
    @State private var currentTurn: Int = 1
    @State private var showingAlert: Bool = false
    
    let gestures: [String] = ["👊", "🤚", "✌️"]
    let winGestures: [String] = ["🤚", "✌️", "👊"]
    let loseGestures: [String] = ["✌️", "👊", "🤚"]
    @State private var alertTitle: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .cyan], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Game \(currentTurn) / 10")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Player score : \(score)")
                    .font(.title3)
                    .foregroundColor(.white)
                ForEach(0..<3) { number in
                    Button {
                        userTapped(number)
                    } label: {
                        Text(gestures[number])
                            .font(.system(size: 180))
                    }
                }
                Text(playerShouldWin ? "Win this game!" : "Lose this game!")
                    .font(.title)
                    .foregroundColor(.white)
            } .alert(alertTitle, isPresented: $showingAlert) {
                Button("Reset") {
                    resetTheGame()
                }
            }
        }
    }
    
    func userTapped(_ number: Int) {
        if playerShouldWin {
            score = winGestures[systemIndex] == gestures[number] ? score + 1 : score - 1
        } else {
            score = loseGestures[systemIndex] == gestures[number] ? score + 1 : score - 1
        }
        if currentTurn == 10 {
            alertTitle = "Your score is \(score)!!!, Reset to play new game."
            showingAlert = true
        } else {
            systemIndex = Int.random(in: 0..<3)
            playerShouldWin.toggle()
            currentTurn += 1
        }
    }
    
    func resetTheGame() {
        score = 0
        systemIndex = Int.random(in: 0..<3)
        playerShouldWin.toggle()
        currentTurn = 1
    }
}

struct RPSContentView_Previews: PreviewProvider {
    static var previews: some View {
        RPSContentView()
    }
}
