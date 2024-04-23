// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class Builder {
    func makeMainViewController() -> MainViewController {
        let networkService = NetworkService()
        let mainViewModel = MainViewModel(networkService: networkService)
        let mainViewController = MainViewController()
        mainViewController.mainViewModel = mainViewModel
        return mainViewController
    }

    func makeDetailViewController() -> FilmDetailsViewController {
        let detailsViewController = FilmDetailsViewController()
        return detailsViewController
    }
}
