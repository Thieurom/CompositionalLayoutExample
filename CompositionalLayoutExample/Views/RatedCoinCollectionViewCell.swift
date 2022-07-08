//
//  RatedCoinCollectionViewCell.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import SnapKit
import UIKit

class RatedCoinCollectionViewCell: BaseCollectionViewCell {

    lazy var iconImageView = UIImageView().apply {
        $0.contentMode = .scaleAspectFill
    }

    lazy var nameLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }

    lazy var descriptionLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textAlignment = .right
    }
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(viewModel: RatedCoinViewModel) {
        viewModel.iconName
            .map(UIImage.init(named:))
            .drive(iconImageView.rx.image)
            .disposed(by: disposeBag)

        viewModel.name
            .drive(nameLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.usdAmount
            .drive(descriptionLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

extension RatedCoinCollectionViewCell {

    private func setupViews() {
        let stackView = UIStackView(
            arrangedSubviews: [
                iconImageView,
                nameLabel
            ]
        ).apply {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 12.0
        }

        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(32.0)
        }

        nameLabel.snp.contentHuggingVerticalPriority = UILayoutPriority.defaultLow.rawValue - 1
        nameLabel.snp.contentCompressionResistanceVerticalPriority = UILayoutPriority.defaultHigh.rawValue - 1

        let containerView = UIView().apply {
            $0.backgroundColor = .lightGray.withAlphaComponent(0.1)
            $0.layer.cornerRadius = 16.0
            [stackView, descriptionLabel].forEach($0.addSubview)
        }

        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().offset(16.0)
        }

        descriptionLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16.0)
            $0.top.equalTo(stackView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().offset(-16.0)
        }

        descriptionLabel.snp.contentHuggingVerticalPriority = UILayoutPriority.defaultLow.rawValue - 2
        descriptionLabel.snp.contentCompressionResistanceVerticalPriority = UILayoutPriority.defaultHigh.rawValue - 2

        contentView.addSubview(containerView)

        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
