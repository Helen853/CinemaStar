// SimilarMovie.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Рекомендации
struct SimilarMovie: Codable {
    /// Наименование
    let name: String
    /// Картинка фильма
    let poster: Poster
}
