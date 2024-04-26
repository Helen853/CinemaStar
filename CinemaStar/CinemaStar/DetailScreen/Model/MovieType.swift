// MovieType.swift
// Copyright © RoadMap. All rights reserved.

/// Тип фильма
enum MovieType: String, Codable {
    /// Фильм
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
