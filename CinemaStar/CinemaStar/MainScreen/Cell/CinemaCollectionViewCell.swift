// CinemaCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фильмом
final class CinemaCollectionViewCell: UICollectionViewCell {
    // MARK: - Visual Components

    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()

    // MARK: - Private Properties

    private var imageRequest: ImageRequest?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
        configureLabel()
        configureImageConstraint()
        configureLabelConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImage()
        configureLabel()
        configureImageConstraint()
        configureLabelConstraint()
    }

    // MARK: - Public Methods

    func configureCell(model: Films) {
        guard let url = URL(string: model.poster) else { return }
        imageRequest = ImageRequest(url: url)
        imageRequest?.execute(withCompletion: { [weak self] image in
            self?.posterImageView.image = image
        })
        let rating = String(format: "%.1f", floor(model.rating * 10) / 10)
        titleLabel.text = "\(model.name) \n ⭐️ \(rating)"
    }

    // MARK: - Private Methods

    private func setupImage() {
        contentView.addSubview(posterImageView)
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 8
    }

    private func configureLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: AppConstants.inter, size: 16)
        titleLabel.textAlignment = .left
    }

    private func configureImageConstraint() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        posterImageView.isUserInteractionEnabled = true
    }

    private func configureLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
