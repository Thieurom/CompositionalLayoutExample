//
//  RatedCoinViewModel.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import RxCocoa
import RxSwift

class RatedCoinViewModel: Hashable {
    static func == (lhs: RatedCoinViewModel, rhs: RatedCoinViewModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id: String
    let name: Driver<String>
    let usdAmount: Driver<String>
    let iconName: Driver<String>

    init(_ ratedCoin: RatedCoin) {
        id = ratedCoin.coin.id
        name = .just(ratedCoin.coin.name).asDriver()
        usdAmount = .just("$\(ratedCoin.inUsd)").asDriver()
        iconName = .just(ratedCoin.coin.id.lowercased()).asDriver()
    }
}
