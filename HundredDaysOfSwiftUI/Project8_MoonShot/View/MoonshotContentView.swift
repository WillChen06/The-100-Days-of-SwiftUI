//
//  MoonshotContentView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/4/27.
//

import SwiftUI

struct SetNavigation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
    }
}

extension View {
    func setNavigationStyle() -> some View {
        modifier(SetNavigation())
    }
}

struct MoonshotContentView: View {
    
    @State private var isGrid = true
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color.darkBackground)
    }
    
    var body: some View {
        NavigationView {
            if isGrid {
                MissionGridView()
                    .setNavigationStyle()
                    .toolbar {
                        Button {
                            isGrid.toggle()
                        } label: {
                            Image(systemName: isGrid ? "list.bullet" : "square.grid.2x2")
                                .foregroundColor(.white)
                        }
                    }
            } else {
                MissionListView()
                    .setNavigationStyle()
                    .toolbar {
                        Button {
                            isGrid.toggle()
                        } label: {
                            Image(systemName: isGrid ? "list.bullet" : "square.grid.2x2")
                                .foregroundColor(.white)
                        }

                    }
            }
        }
    }
}

struct MoonshotContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoonshotContentView()
    }
}
