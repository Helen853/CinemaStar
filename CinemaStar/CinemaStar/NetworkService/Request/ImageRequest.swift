// ImageRequest.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// kil
class ImageRequest {
    let url: URL

    init(url: URL) {
        self.url = url
    }
}

// extension ImageRequest: NetworkRequest {
//    typealias ModelType = UIImage
//
//    func decode(_ data: Data) -> UIImage? {
//        UIImage(data: data)
//    }
//
//    func execute(withCompletion completion: @escaping (UIImage?) -> Void) {
//        // getImage(request: URLRequest(url: url), completion: completion)
//    }
// }
