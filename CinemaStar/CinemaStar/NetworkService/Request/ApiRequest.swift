// ApiRequest.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// kil
class APIRequest<Resource: APIResource> {
    let resource: Resource

    init(resource: Resource) {
        self.resource = resource
    }
}

// MARK: - Extension APIRequest + NetworkRequest

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Films]? {
        let decoder = JSONDecoder()
        let result = try? decoder.decode(FilmsDTO.self, from: data)
        let res = result?.docs.map { Films(dto: $0) }
        return res
    }

    func execute(withCompletion completion: @escaping (Result<[Films], Error>) -> Void) {
        guard let resource = resource.request else { return }
        getFilms(request: resource, completion: completion)
    }
}
