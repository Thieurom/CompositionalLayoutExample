//
//  BaseCollectionViewCell.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import RxSwift
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    private(set) var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }
}
