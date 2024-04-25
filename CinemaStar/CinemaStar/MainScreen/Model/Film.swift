// Film.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные с фильмами
final class Films: Decodable, Encodable {
    // MARK: - Public Properties

    let name: String
    let rating: Double
    let poster: String
    let id: Int

    init(dto: FilmDTO) {
        name = dto.name
        rating = dto.rating.kp
        poster = dto.poster.url
        id = dto.id
    }
}
