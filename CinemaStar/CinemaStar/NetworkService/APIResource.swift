// APIResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для апи ресурса
protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var queryItems: URLQueryItem? { get }
}

extension APIResource {
    // свойство с конфигурацией ЮРЛзапроса
    var url: URL? {
        // URL-адрес API
        var components = URLComponents(string: "https://api.kinopoisk.dev/v1.4/movie") ?? URLComponents()
        components.path += methodPath
        if let queryItems {
            components.queryItems = [queryItems]
        }
        return components.url
    }
}

/// Модель для запроса
struct FilmsResource: APIResource {
    typealias ModelType = FilmsDTO
    var id: Int?

    var methodPath: String {
        guard let id = id else {
            return "/search"
        }
        return "/search/\(id)"
    }

    var queryItems: URLQueryItem?
}

/// Модель запроса для детального фильма
struct FilmsDetailResource: APIResource {
    typealias ModelType = MovieDTO
    var id: Int

    var methodPath: String {
        "/\(String(describing: id))"
    }

    var queryItems: URLQueryItem?
}
