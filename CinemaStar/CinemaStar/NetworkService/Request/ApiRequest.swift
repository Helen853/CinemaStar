// ApiRequest.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Ресурс для запроса
class APIRequest<Resource: APIResource> {
    let resource: Resource

    init(resource: Resource) {
        self.resource = resource
    }
}

// MARK: - Extension APIRequest + NetworkRequest

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> Resource.ModelType? {
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(Resource.ModelType.self, from: data)
        return decodedData
    }

    func execute(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
        if let url = resource.url {
            getFilms(url: url, completion: completion)
        }
    }
}
