// FilmsDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для каталого фильмов
struct FilmsDTO: Codable {
    /// Массив фильмов
    let docs: [FilmDTO]
}
