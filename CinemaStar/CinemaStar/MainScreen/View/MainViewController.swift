// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран с фильмами
final class MainViewController: UIViewController {
    // MARK: - Visual Components

    private let titleLabel = UILabel()
    private var collectionView: UICollectionView?

    // MARK: - Public Properties

    var mainViewModel: MainViewModelProtocol?

    // MARK: - Private Properties

    private var films: [Films]? = []
    var token = ProxyTokenService()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        token.createtoken()
        mainViewModel?.saveToken()
        setGradient()
        mainViewModel?.callService()
        setupUi()
        setupConstraint()
        loadFilms()
    }

    // MARK: - Private Methods

    private func loadFilms() {
        mainViewModel?.filmsLoaded = { [weak self] response in
            self?.films = response
            Task {
                await MainActor.run {
                    self?.collectionView?.reloadData()
                }
            }
        }
    }

    private func setupUi() {
        configureCollection()
        configureTitle()
    }

    private func configureTitle() {
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: AppConstants.inter, size: 20)
        let boldAttributed = [NSAttributedString.Key.font: UIFont(name: AppConstants.interBold, size: 20)]
        let title = NSMutableAttributedString(string: AppConstants.title)
        let allText = NSMutableAttributedString(
            string: AppConstants.cinemaTitle,
            attributes: boldAttributed as [NSAttributedString.Key: Any]
        )
        title.append(allText)
        titleLabel.attributedText = title
    }

    private func configureTitleConstraint() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
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

    private func configureCollection() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            CinemaCollectionViewCell.self,
            forCellWithReuseIdentifier: AppConstants.cinemaIdentifier
        )
    }

    private func configureCollectionConstraint() {
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 128).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        return layout
    }

    private func setupConstraint() {
        configureCollectionConstraint()
        configureTitleConstraint()
    }
}

// MARK: - Extension MainViewController + UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        films?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppConstants.cinemaIdentifier,
            for: indexPath
        ) as? CinemaCollectionViewCell,
            let films = films
        else {
            return UICollectionViewCell()
        }

        cell.configureCell(model: films[indexPath.item])
        return cell
    }
}

// MARK: - Extension MainViewController + UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let idFilm = films?[indexPath.item].id else { return }
        mainViewModel?.showDetail(id: idFilm)
    }
}

// MARK: - Extension MainViewController + UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 170, height: 248)
    }
}
