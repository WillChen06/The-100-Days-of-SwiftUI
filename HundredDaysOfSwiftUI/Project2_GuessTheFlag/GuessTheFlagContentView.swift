//
//  GuessTheFlagContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/13.
//

import SwiftUI

struct GuessTheFlagContentView: View {
    @State private var showingScore = false
    @State private var showingFinal = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var score = 0
    @State private var questions = 8
    
    @State private var flagsDegree = [0.0, 0.0, 0.0]
    @State private var flagsOpacity = [1.0, 1.0, 1.0]
    @State private var flagsScale = [1.0, 1.0, 1.0]
    
    struct FlagImage: View {
        let name: String
        var body: some View {
            Image(name)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(name: countries[number])
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
                        .rotation3DEffect(.degrees(flagsDegree[number]), axis: (x: 0, y: 1, z: 0))
                        .opacity(flagsOpacity[number])
                        .scaleEffect(flagsScale[number])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if questions == 0 {
                Button("Reset", action: reset)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            Text(questions == 0 ? "Your final score is \(score)" : "Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            withAnimation {
                flagsDegree[correctAnswer] = 360
                for (index, _)  in flagsOpacity.enumerated() {
                    flagsOpacity[index] = index == correctAnswer ? 1.0 : 0.25
                }
                for (index, _)  in flagsScale.enumerated() {
                    flagsScale[index] = index == correctAnswer ? 1.0 : 0.25
                }
            }
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That???s the flag of \(countries[number])"
        }
        questions -= 1
        showingScore = true
    }
    
    func askQuestion() {
        flagsScale = [1.0, 1.0, 1.0]
        flagsDegree = [0.0, 0.0, 0.0]
        flagsOpacity = [1.0, 1.0, 1.0]
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        askQuestion()
        score = 0
        questions = 8
    }
}

struct GuessTheFlagContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagContentView()
    }
}
