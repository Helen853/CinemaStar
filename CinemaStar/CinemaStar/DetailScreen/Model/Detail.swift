// Detail.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Детальный фильм
struct FilmsDetail {
    let posterURL: String
    let name: String
    let rating: Double
    let description: String
    let year: Int
    let country: String
    let type: MovieType
    let actors: [Person]
    let language: String
    let recommendedMovies: [SimilarMovie?]
}

/// Тип фильма
enum MovieType: String, Codable {
    /// Movie type
    case movie
    /// Series
    case tvSeries = "tv-series"
    /// Description of movie type
    var typeDescription: String {
        switch self {
        case .movie:
            return "Фильм"
        case .tvSeries:
            return "Сериал"
        }
    }
}
