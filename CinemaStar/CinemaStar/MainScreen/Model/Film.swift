// Film.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные с фильмами
final class Films: Decodable, Encodable {
    // MARK: - Public Properties

    let name: String
    let rating: Double
    let poster: String

    init(dto: FilmDTO) {
        name = dto.name
        rating = dto.rating.kp
        poster = dto.poster.url
    }
}

// Data
// class FilmsDataModel {
//    private var films: [Films] = []
//    private var isLoading = false
//
//    private var request: APIRequest<FilmsResource>?
//
//    func fetchTopQuestions() {
//        guard !isLoading else { return }
//        isLoading = true
//        let resource = FilmsResource()
//        let request = APIRequest(resource: resource)
//        self.request = request
//        request.execute { [weak self] films in
//            self?.films = films ?? []
//            self?.isLoading = false
//        }
//    }
// }

// test Data
// struct TestData {
//    var Films: [FilmsDTO] = {
//        let url = Bundle.main.url(forResource: "Films", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        let result = try! JSONDecoder().decode(FilmsDTO.self, from: data)
//        let res = result.docs.map { Films(dto: $0) }
//        return [res]
//    }()
// }
