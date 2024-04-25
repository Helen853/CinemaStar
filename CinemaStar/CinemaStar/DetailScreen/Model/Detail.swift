// Detail.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Детальный фильм
struct FilmsDetail {
    let poster: Poster
    let name: String
    let rating: Rating
    let description: String
    let year: Int
    let countries: String?
    let type: String
    let persons: [Person]?
    let spokenLanguages: [String]?
    let similarMovies: [SimilarMovie]?

    init(dto: MovieDTO) {
        poster = dto.poster
        name = dto.name
        rating = dto.rating
        description = dto.description
        year = dto.year
        countries = dto.countries.first?.name
        type = dto.type.typeDescription
        persons = dto.persons
        spokenLanguages = dto.spokenLanguages
        similarMovies = dto.similarMovies
    }
}

/// Тип фильма
enum MovieType: String, Codable {
    ///
    case movie
    ///
    case tvSeries = "tv-series"
    /// 
    var typeDescription: String {
        switch self {
        case .movie:
            return "Фильм"
        case .tvSeries:
            return "Сериал"
        }
    }
}
