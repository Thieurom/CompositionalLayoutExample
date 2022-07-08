//
//  UICollectionView+Register.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_ classType: T.Type) {
        register(classType, forCellWithReuseIdentifier: String(describing: T.self))
    }

    func register<T: UICollectionReusableView>(_ classType: T.Type, sectionKind: String) {
        let reuseIdentifier = String(describing: T.self)
        register(classType, forSupplementaryViewOfKind: sectionKind, withReuseIdentifier: reuseIdentifier)
    }
}
