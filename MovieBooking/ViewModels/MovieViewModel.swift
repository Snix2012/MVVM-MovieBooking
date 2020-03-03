//
//  MovieViewModel.swift
//  MovieBooking
//
//  Created by claire.roughan on 03/03/2020.
//  Copyright © 2020 claire.roughan. All rights reserved.
//

import SwiftUI

/// Keys to retrieve specific section from the model
enum HomeSection: String, CaseIterable {
    case Trending
    case Popular
    case Upcoming
    case Actors
}


class MovieViewModel: ObservableObject {
    
    /** Set the published property wrapper to create observable objects that automatically announce when changes occur to notify interested views so that they can reload and reflect the current state of the model
    */
    @Published var allItems: [HomeSection:[Codable]] = [:]
    
    init() {
        getAll()
    }
    
    /// Read the file containing the data
    private func getAll(){
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let decoder = JSONDecoder()
                
                /// decode to MovieBundle modeel
                let result = try decoder.decode(MovieBundle.self, from: data)
                allItems = [HomeSection.Trending: result.trending,
                            HomeSection.Popular: result.popular,
                            HomeSection.Upcoming: result.upcoming,
                            HomeSection.Actors: result.actors]
                
            } catch let e{
                print(e)
            }
        }
    }
}
