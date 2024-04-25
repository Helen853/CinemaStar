// FilmsDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для каталого фильмов
struct FilmsDTO: Codable {
    // массив фильмов
    let docs: [FilmDTO]
}
