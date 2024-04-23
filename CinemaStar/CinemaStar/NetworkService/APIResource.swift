// APIResource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол для апи ресурса
protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var filter: String? { get }
}

extension APIResource {
    // свойство с конфигурацией ЮРЛзапроса
    var request: URLRequest? {
        // URL-адрес API
        var components = URLComponents(string: "https://api.kinopoisk.dev/v1.4/movie/search")
        components?.path = methodPath
        components?.queryItems = [URLQueryItem(name: "query", value: "история")]
        guard let req = components?.url else { return nil }
        var request = URLRequest(url: req)
        request.setValue("W1DJ0J7-2KV4JBC-HRQH66X-JTVVYXG", forHTTPHeaderField: "X-API-KEY")
        return request
    }
}

/// Модель для запроса
struct FilmsResource: APIResource {
    typealias ModelType = Films
    var id: Int?
    var methodPath: String {
        guard let id = id else {
            return "/search"
        }
        return "/search/\(id)"
    }

    var filter: String? {
        id != nil ? "4707110" : nil
    }
}
