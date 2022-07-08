//
//  TotalBalanceCollectionViewCell.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import SnapKit
import UIKit

class TotalBalanceCollectionViewCell: BaseCollectionViewCell {

    lazy var titleLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textAlignment = .center
    }

    lazy var amountLabel = UILabel().apply {
        $0.font = .systemFont(ofSize: 32, weight: .bold)
        $0.textAlignment = .center
    }

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(viewModel: TotalBalanceViewModel) {
        viewModel.title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.usdAmount
            .drive(amountLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

extension TotalBalanceCollectionViewCell {

    private func setupViews() {
        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                amountLabel
            ]
        ).apply {
            $0.axis = .vertical
            $0.spacing = 12.0
        }

        titleLabel.snp.contentHuggingVerticalPriority = UILayoutPriority.defaultLow.rawValue - 1
        titleLabel.snp.contentCompressionResistanceVerticalPriority = UILayoutPriority.defaultHigh.rawValue - 1

        contentView.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(24.0)
        }
    }
}
