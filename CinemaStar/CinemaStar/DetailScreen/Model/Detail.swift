// Detail.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Детальный фильм
struct FilmsDetail {
    // Картинка фильма
    let poster: Poster
    // Наименование
    let name: String
    // Рейтинг
    let rating: Rating
    // Описание
    let description: String
    // Год
    let year: Int
    // Страна происхождения
    let countries: String?
    // Тип фильма
    let type: String
    // Актеры
    let persons: [Person]?
    // Язык
    let spokenLanguages: [String]?
    // Рекомендованные фильмы
    let similarMovies: [SimilarMovie]?

    // MARK: - Initializers

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
    /// фильм
    case movie
    /// Сериал
    case tvSeries

    var typeDescription: String {
        switch self {
        case .movie:
            return "Фильм"
        case .tvSeries:
            return "Сериал"
        }
    }
}
