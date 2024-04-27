// FilmsDetailResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель запроса для детального фильма
struct FilmsDetailResource: APIResource {
    /// Тип объекта
    typealias ModelType = MovieDTO

    /// Идентификатор для ресурса запроса
    var id: Int

    /// Путь
    var methodPath: String {
        "/\(String(describing: id))"
    }

    /// Парметры запроса
    var queryItems: URLQueryItem?
}
