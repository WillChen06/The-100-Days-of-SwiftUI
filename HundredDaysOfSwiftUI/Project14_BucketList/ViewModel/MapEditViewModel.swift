//
//  MapEditViewModel.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/6/1.
//

import Foundation

extension MapEditView {
    @MainActor class MapEditViewModel: ObservableObject {
        @Published var location: Location? {
            didSet {
                name = location?.name ?? ""
                description = location?.description ?? ""
            }
        }
        @Published var name: String
        @Published var description: String
        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()
        
        init() {
            self.name = ""
            self.description = ""
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location!.coordinate.latitude)%7C\(location!.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted ()
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
        
        func updateLocation(_ location: Location) {
            self.location = location
        }
    }
    
    
}
