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

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Films]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let result = try? JSONDecoder().decode(FilmsDTO.self, from: data)
        let res = result?.docs.map { Films(dto: $0) }
        return res
    }

    func execute(withCompletion completion: @escaping (Result<[Films], Error>) -> Void) {
        print("")
    }
}
