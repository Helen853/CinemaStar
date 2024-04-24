// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MainViewModelProtocol {
    var filmsLoaded: (([Films]) -> Void)? { get set }
    var coordinator: CinemaCoordinator? { get set }
    func callService()
    func getImage(index: Int, handler: @escaping (Data) -> ())
    func showDetail()
}

final class MainViewModel {
    var filmsLoaded: (([Films]) -> Void)?
    var films: [Films]?
    let resource = FilmsResource()
    private var imageService = LoadImageSErvice()
    var coordinator: CinemaCoordinator?

    init(coordinator: CinemaCoordinator) {
        self.coordinator = coordinator
    }
}

extension MainViewModel: MainViewModelProtocol {
    func showDetail() {
        coordinator?.showDetailFilm()
    }

    func callService() {
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
        guard let films = films else { return }
        guard let imageURL = URL(string: films[index].poster) else { return }
        imageService.loadImage(url: imageURL, complition: { data, _, _ in
            guard let data = data else { return }
            handler(data)
        })
    }
}
