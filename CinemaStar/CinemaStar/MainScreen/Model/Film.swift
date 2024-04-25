// Film.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные с фильмами
final class Films: Decodable, Encodable {
    // MARK: - Public Properties

    // Наименование
    let name: String
    // Рейтинг
    let rating: Double
    // Картинка фильма
    let poster: String
    // Идентификатор
    let id: Int

    // MARK: - Initializers

    init(dto: FilmDTO) {
        name = dto.name
        rating = dto.rating.kp
        poster = dto.poster.url
        id = dto.id
    }
}
