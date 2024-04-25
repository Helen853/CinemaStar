// DetailDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для детального фильма
struct MovieDTO: Codable {
    // Идентификатор
    let id: Int
    // Картинка фильма
    let poster: Poster
    // Наименование
    let name: String
    // Рейтинг
    let rating: Rating
    // Описание
    let description: String
    // Год выпуска
    let year: Int
    // Страна происхождения
    let countries: [Country]
    // Тип фильма
    let type: MovieType
    // Актеры
    let persons: [Person]?
    // Язык
    let spokenLanguages: [String]?
    // Рекомендованные фильмы
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
