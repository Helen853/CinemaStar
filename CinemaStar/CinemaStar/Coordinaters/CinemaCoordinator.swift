// CinemaCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор экрана с фильмами
final class CinemaCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController?

    override func start() {
        showCinema()
    }

    func setRootViewController(view: UIViewController) {
        rootViewController = UINavigationController(rootViewController: view)
    }

    func showCinema() {
        let coordinator = CinemaCoordinator()
        let mainViewController = Builder().makeMainViewController(coordinator: coordinator)
        let rootViewController = UINavigationController(rootViewController: mainViewController)
        setAsRoot​(​_​: rootViewController)
        self.rootViewController = rootViewController
    }

    func showDetailFilm() {
        let detailViewController = Builder().makeDetailViewController()
        showCinema()
        rootViewController?.pushViewController(detailViewController, animated: true)
    }
}
