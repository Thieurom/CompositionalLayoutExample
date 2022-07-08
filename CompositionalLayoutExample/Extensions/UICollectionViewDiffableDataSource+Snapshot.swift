//
//  UICollectionViewDiffableDataSource+Snapshot.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import UIKit

extension UICollectionViewDiffableDataSource {
    var snapshot: NSDiffableDataSourceSnapshot<SectionIdentifierType, ItemIdentifierType> {
        get { snapshot() }
        set { apply(newValue) }
    }
}
