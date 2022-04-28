//
//  MissionListView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/28.
//

import SwiftUI

struct MissionListView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List(missions, id: \.id) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack(spacing: 16) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(.vertical)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }.listRowBackground(Color.lightBackground)
            
        }
    }
}


struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
