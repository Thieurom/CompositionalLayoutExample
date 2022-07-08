//
//  CoinItemCollectionViewCell.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import SnapKit
import UIKit

class AssetCollectionViewCell: BaseCollectionViewCell {

    lazy var descriptionView = DescriptionView()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(viewModel: AssetViewModel) {
        viewModel.iconName
            .map(UIImage.init(named:))
            .drive(descriptionView.iconImageView.rx.image)
            .disposed(by: disposeBag)

        viewModel.name
            .drive(descriptionView.nameLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.balance
            .drive(descriptionView.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

extension AssetCollectionViewCell {

    private func setupViews() {
        contentView.addSubview(descriptionView)

        descriptionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16.0)
            $0.verticalEdges.equalToSuperview().inset(8.0)
        }
    }
}
