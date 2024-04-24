// RecomendationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендованными фильмами
final class RecomendationTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let titleLabel = UILabel()
    private var collectionView: UICollectionView?

    var film: FilmsDetail? {
        didSet {
            collectionView?.reloadData()
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
        setupCinstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUi()
        setupCinstraint()
    }

    // MARK: - Public Methods

    func configureCell(model: FilmsDetail) {
        setupUi()
        setupCinstraint()
    }

    // MARK: - Private Methods

    private func setupUi() {
        configureTitleLabel()
        configureCollectionView()
    }

    private func setupCinstraint() {
        configureTitleConstraint()
        configureCollectionConstraint()
    }

    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.text = AppConstants.lookText
        titleLabel.font = UIFont(name: AppConstants.interBold, size: 14)
        titleLabel.textAlignment = .left
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        guard let collectionView = collectionView else { return }
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            RecommendationCollectionViewCell.self,
            forCellWithReuseIdentifier: AppConstants.reccommenationCollectionIdentifier
        )
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 96)
        return layout
    }

    private func configureTitleConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }

    private func configureCollectionConstraint() {
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: 100).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension RecomendationTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        film?.recommendedMovies.count ?? 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AppConstants.reccommenationCollectionIdentifier,
            for: indexPath
        ) as? RecommendationCollectionViewCell
        else { return UICollectionViewCell() }
        guard let similarMovie = film?.recommendedMovies[indexPath.item] else { return cell }
        cell.configure(cinema: similarMovie)
        return cell
    }
}
