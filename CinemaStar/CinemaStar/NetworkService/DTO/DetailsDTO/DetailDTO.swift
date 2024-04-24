// DetailDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Movie data fron network
struct MovieDTO: Codable {
    let id: Int
    let poster: Poster
    let name: String
    let rating: Rating
    let description: String
    let year: Int
    let countries: [Country]
    let type: MovieType
    let persons: [Person]?
    let spokenLanguages: [String]?
    let similarMovies: [SimilarMovie]?
}

/// Movie poster data
struct Poster: Codable {
    let url: String?
}

/// Movie country data
struct Country: Codable {
    let name: String
}

/// Movie rating data
struct Rating: Codable {
    let kp: Double
}

///
struct Person: Codable {
    let photo: String
    let name: String
}

/// Similar movie data
struct SimilarMovie: Codable {
    let name: String
    let poster: Poster
}
