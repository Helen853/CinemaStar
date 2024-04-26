// FilmsResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для запроса фильма
struct FilmsResource: APIResource {
    /// Тип объекта
    typealias ModelType = FilmsDTO

    /// Путь
    var methodPath: String {
        "/search"
    }

    /// Параметры запроса
    var queryItems: URLQueryItem?
}
