//
//  AssetViewModel.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import RxCocoa
import RxSwift

class AssetViewModel: Hashable {
    static func == (lhs: AssetViewModel, rhs: AssetViewModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id: String
    let name: Driver<String>
    let balance: Driver<String>
    let iconName: Driver<String>

    init(_ asset: Asset) {
        id = asset.coin.id
        name = .just(asset.coin.name).asDriver()
        balance = .just("$\(asset.balance)").asDriver()
        iconName = .just(asset.coin.id.lowercased()).asDriver()
    }
}
