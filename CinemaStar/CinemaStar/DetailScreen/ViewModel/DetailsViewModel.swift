// DetailsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol DetailsViewModelProtocol {
    var filmsLoaded: ((FilmsDetail) -> Void)? { get set }
    var coordinator: CinemaCoordinator? { get set }
    func callService()
    func getImage(index: Int, handler: @escaping (Data) -> ())
}

final class DetailsViewModel {
    var filmsLoaded: ((FilmsDetail) -> Void)?
    var films: FilmsDetail?
    private var imageService = LoadImageSErvice()
    var coordinator: CinemaCoordinator?
    var resource = FilmsResource()
    var idFilm: Int
    
    init(coordinator: CinemaCoordinator, idFilm: Int) {
        self.coordinator = coordinator
        self.idFilm = idFilm
        
    }
}

extension DetailsViewModel: DetailsViewModelProtocol {
    
    func callService() {
        resource.id = idFilm
        let request = APIRequest(resource: resource)
        request.execute { [weak self] response in
            switch response {
            case let .success(films):
                self?.films = films
                self?.filmsLoaded?(films)
            case let .failure(error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func getImage(index: Int, handler: @escaping (Data) -> ()) {
        <#code#>
    }
}
