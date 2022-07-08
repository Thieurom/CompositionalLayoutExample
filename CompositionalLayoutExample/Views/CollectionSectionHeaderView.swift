//
//  CollectionSectionHeaderView.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import SnapKit
import UIKit

class CollectionSectionHeaderView: UICollectionReusableView {

    lazy var titleLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
    }

    lazy var button = UIButton(type: .system).apply {
        $0.setTitle("See all", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionSectionHeaderView {

    private func setupViews() {
        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                button
            ]
        ).apply {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 12.0
        }

        addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16.0)
            $0.verticalEdges.equalToSuperview().inset(16.0)
        }

        titleLabel.snp.contentHuggingHorizontalPriority = UILayoutPriority.defaultLow.rawValue - 1
        titleLabel.snp.contentCompressionResistanceHorizontalPriority = UILayoutPriority.defaultHigh.rawValue - 1
    }
}
