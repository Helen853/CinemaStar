// FilmsDetailResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель запроса для детального фильма
struct FilmsDetailResource: APIResource {
    // тип объекта
    typealias ModelType = MovieDTO

    // идентификатор для ресурса запроса
    var id: Int

    // путь
    var methodPath: String {
        "/\(String(describing: id))"
    }

    // парметры запроса
    var queryItems: URLQueryItem?
}
