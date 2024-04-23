// FilmDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с деталями фильма
final class FilmDetailsViewController: UIViewController {
    var detailsViewModel: DetailsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
    }

    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 179 / 255, green: 141 / 255, blue: 87 / 255, alpha: 0.51).cgColor,
            UIColor(red: 43 / 255, green: 81 / 255, blue: 74 / 255, alpha: 1.0).cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
