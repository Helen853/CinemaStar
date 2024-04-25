// DetailDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для детального фильма
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

/// Картинка фильма
struct Poster: Codable {
    let url: String
}

/// Cтрана
struct Country: Codable {
    let name: String
}

/// Рейтинг
struct Rating: Codable {
    let kp: Double
}

/// Актеры
struct Person: Codable {
    let photo: String
    let name: String
}

/// Рекомендации
struct SimilarMovie: Codable {
    let name: String
    let poster: Poster
}
