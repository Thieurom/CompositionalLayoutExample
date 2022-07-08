//
//  Array+Snapshot.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import UIKit

extension Array where Element: Sectionable {

    var snapshot: NSDiffableDataSourceSnapshot<Element, Element.Item> {
        var snapshot = NSDiffableDataSourceSnapshot<Element, Element.Item>()

        self.forEach { section in
            snapshot.appendSections([section])
            snapshot.appendItems(section.items)
        }

        return snapshot
    }
}
