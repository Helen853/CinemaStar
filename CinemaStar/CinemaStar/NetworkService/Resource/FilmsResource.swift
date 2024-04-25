// FilmsResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для запроса фильма
struct FilmsResource: APIResource {
    // тип объекта
    typealias ModelType = FilmsDTO

    // путь
    var methodPath: String {
        "/search"
    }

    // параметры запроса
    var queryItems: URLQueryItem?
}
