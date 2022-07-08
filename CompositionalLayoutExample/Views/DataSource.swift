//
//  DataSource.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import UIKit

class DataSource: UICollectionViewDiffableDataSource<Section, Item> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case let .totalBalance(totalBalanceViewModel):
                let cell = collectionView.dequeue(TotalBalanceCollectionViewCell.self, for: indexPath)
                cell.bind(viewModel: totalBalanceViewModel)
                return cell
            case let .asset(assetViewModel):
                let cell = collectionView.dequeue(AssetCollectionViewCell.self, for: indexPath)
                cell.bind(viewModel: assetViewModel)
                return cell
            case let .transaction(transactionViewModel):
                let cell = collectionView.dequeue(TransactionCollectionViewCell.self, for: indexPath)
                cell.bind(viewModel: transactionViewModel)
                return cell
            case let .trendingCoin(ratedCoinViewModel):
                let cell = collectionView.dequeue(RatedCoinCollectionViewCell.self, for: indexPath)
                cell.bind(viewModel: ratedCoinViewModel)
                return cell
            }
        }

        self.supplementaryViewProvider = { [unowned self] collectionView, kind, indexPath in
            let sections = self.snapshot().sectionIdentifiers
            let sectionIndex = indexPath.section
            guard (0..<sections.count) ~= sectionIndex else { return nil }

            let headerView = collectionView.dequeue(CollectionSectionHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader, for: indexPath)
            headerView.titleLabel.text = sections[sectionIndex].header
            return headerView
        }
    }
}
