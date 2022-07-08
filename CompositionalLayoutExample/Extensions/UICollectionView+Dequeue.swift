//
//  UICollectionView+Dequeue.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import UIKit

extension UICollectionView {

    func dequeue<T: UICollectionViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(T.self) is not registered")
        }
        return cell
    }

    func dequeue<T: UICollectionReusableView>(_ classType: T.Type, ofKind kind: String, for indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: T.self)
        guard let view = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: reuseIdentifier,
            for: indexPath) as? T else {
                fatalError("\(T.self) is not registered")
        }
        return view
    }
}
