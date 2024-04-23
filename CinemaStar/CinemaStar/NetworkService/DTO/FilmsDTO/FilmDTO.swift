// FilmDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// film
struct FilmDTO: Codable {
    let name: String
    let rating: RatingDTO
    let poster: ImageDTO
}
