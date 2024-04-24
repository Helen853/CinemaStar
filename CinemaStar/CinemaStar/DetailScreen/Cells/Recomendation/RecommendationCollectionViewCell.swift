// RecommendationCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендованными фильмами
final class RecommendationCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private let photoImageView = UIImageView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
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

    func configure(cinema: SimilarMovie) {
        titleLabel.text = cinema.name
    }

    func configureImage(image: UIImage) {
        photoImageView.image = image
    }

    // MARK: - Private Methods

    private func setupUi() {
        configureTitleLabel()
        configurePhotoImage()
    }

    private func setupCinstraint() {
        configurePhotoConstraint()
        configureTitleConstraint()
    }

    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: AppConstants.inter, size: 16)
        titleLabel.textAlignment = .left
    }

    private func configurePhotoImage() {
        contentView.addSubview(photoImageView)
    }

    private func configureTitleConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 2).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func configurePhotoConstraint() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
