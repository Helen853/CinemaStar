// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Главный координатор
final class AppCoordinator: BaseCoordinator {
    override func start() {
        showCinemaModule()
    }

    private func showCinemaModule() {
        let cinemaCoordinator = CinemaCoordinator()
        add(coordinator: cinemaCoordinator)
        cinemaCoordinator.start()
    }
}
