//
//  MovieBundle.swift
//  MovieBooking
//
//  Created by claire.roughan on 03/03/2020.
//  Copyright © 2020 claire.roughan. All rights reserved.
//

import SwiftUI

///MovieBundle struct is the one that we will use to decode the data
struct MovieBundle: Codable, Hashable {
    let trending: [Trending]
    let popular: [Popular]
    let actors: [Actor]
    let upcoming: [Upcoming]
}


///Movie protocol that all our movies must conform to
protocol Movie: Codable, Hashable {
    var id: Int { get }
    var title: String { get }
    var releaseDate: String { get }
    var description: String { get }
    var image: String { get }
    var rating: Double { get }
    var genres: [String] { get }
    var runtime: String { get }
    var studio: String? { get }
}


// MARK: - Trending
struct Trending: Movie {
    let id: Int
    let title, releaseDate, description, image: String
    let rating: Double
    let genres: [String]
    let runtime: String
    var studio: String? = ""
    
    static var `default`: Trending{
        .init(id: 0, title: "", releaseDate: "", description: "", image: "", rating: 0, genres: [], runtime: "", studio: "")
    }
}


// MARK: - Actor
struct Actor: Codable, Hashable {
    let id: Int
    let name, bio, image: String
    
    static var `default`: Actor{
        .init(id: 0, name: "", bio: "", image: "")
    }

}

// MARK: - Popular
struct Popular: Movie {
    let id: Int
    let title, releaseDate, description, image: String
    let rating: Double
    let genres: [String]
    let runtime: String
    var studio: String? = ""
    
    static var `default`: Popular{
        .init(id: 0, title: "", releaseDate: "", description: "", image: "", rating: 0, genres: [], runtime: "", studio: "")
    }

}

// MARK: - Upcoming
struct Upcoming: Movie {
    let id: Int
    let title, releaseDate, description, image: String
    let rating: Double
    let genres: [String]
    let runtime: String
    var studio: String? = ""
    
    static var `default`: Upcoming{
        .init(id: 0, title: "", releaseDate: "", description: "", image: "", rating: 0, genres: [], runtime: "", studio: "")
    }
}


