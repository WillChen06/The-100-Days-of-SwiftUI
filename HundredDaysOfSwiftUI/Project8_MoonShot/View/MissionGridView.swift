//
//  MissionGridView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/28.
//

import SwiftUI

struct MissionGridView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .accessibility(label: Text(""))
                                    .accessibility(value: Text(mission.displayName))
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                                    .accessibility(label: Text(""))
                                    .accessibility(value: Text(mission.formattedLaunchDate))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}


struct MissionGridView_Previews: PreviewProvider {
    static var previews: some View {
        MissionGridView()
    }
}
