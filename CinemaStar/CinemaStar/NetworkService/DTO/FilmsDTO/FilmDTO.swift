// FilmDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Фильм
struct FilmDTO: Codable {
    /// Наименование
    let name: String
    /// Рейтинг
    let rating: RatingDTO
    /// Картинка фильма
    let poster: ImageDTO
    /// Идентификатор
    let id: Int
}
