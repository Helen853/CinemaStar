// DetailDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для детального фильма
struct MovieDTO: Codable {
    /// Идентификатор
    let id: Int
    /// Картинка фильма
    let poster: Poster
    /// Наименование
    let name: String
    /// Рейтинг
    let rating: Rating
    /// Описание
    let description: String
    /// Год выпуска
    let year: Int
    /// Страна происхождения
    let countries: [Country]
    /// Тип фильма
    let type: MovieType
    /// Актеры
    let persons: [Person]?
    /// Язык
    let spokenLanguages: [String]?
    /// Рекомендованные фильмы
    let similarMovies: [SimilarMovie]?
}
