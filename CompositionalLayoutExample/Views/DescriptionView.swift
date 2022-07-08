//
//  DescriptionView.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import SnapKit
import UIKit

class DescriptionView: UIView {
    
    lazy var iconImageView = UIImageView().apply {
        $0.contentMode = .scaleAspectFill
    }

    lazy var nameLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }

    lazy var descriptionLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 16, weight: .light)
    }

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {

    private func setupViews() {
        let stackView = UIStackView(
            arrangedSubviews: [
                iconImageView,
                nameLabel,
                descriptionLabel
            ]
        ).apply {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 12.0
        }

        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(32.0)
        }

        nameLabel.snp.contentHuggingHorizontalPriority = UILayoutPriority.defaultLow.rawValue - 1
        nameLabel.snp.contentCompressionResistanceHorizontalPriority = UILayoutPriority.defaultHigh.rawValue - 1

        addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
