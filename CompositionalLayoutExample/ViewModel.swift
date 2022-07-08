//
//  ViewModel.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

struct ViewModelInput {}

struct ViewModelOutput {
    let items: Driver<[Section]>
}

struct Section: Sectionable {
    let header: String?
    let items: [Item]
}

enum Item: Hashable {
    case totalBalance(TotalBalanceViewModel)
    case asset(AssetViewModel)
    case transaction(TransactionViewModel)
    case trendingCoin(RatedCoinViewModel)
}

class ViewModel {

    func transform(input: ViewModelInput) -> ViewModelOutput {
        let bitcoin = Coin(id: "BTC", name: "Bitcoin")
        let ethereum = Coin(id: "ETH", name: "Ethereum")
        let binance = Coin(id: "BNB", name: "Binance")

        let assets: [Asset] = [
            .init(coin: bitcoin, balance: 410),
            .init(coin: ethereum, balance: 1000),
            .init(coin: binance, balance: 750)
        ]

        let transactions: [Transaction] = [
            .init(coin: bitcoin, amount: 20, type: .sell),
            .init(coin: ethereum, amount: 15, type: .buy),
            .init(coin: binance, amount: 5, type: .buy)
        ]

        let trendingsCoins: [RatedCoin] = [
            .init(coin: bitcoin, inUsd: 3450),
            .init(coin: ethereum, inUsd: 200),
            .init(coin: binance, inUsd: 450)
        ]

        return ViewModelOutput(
            items: .just([
                .init(
                    header: nil,
                    items: [
                        Item.totalBalance(TotalBalanceViewModel(usdAmount: 2345.1))
                    ]
                ),
                .init(
                    header: "Assets",
                    items: assets.map(AssetViewModel.init).map(Item.asset)
                ),
                .init(
                    header: "Transactions",
                    items: transactions.map(TransactionViewModel.init).map(Item.transaction)
                ),
                .init(
                    header: "Trending Coins",
                    items: trendingsCoins.map(RatedCoinViewModel.init).map(Item.trendingCoin)
                )
            ]).asDriver()
        )
    }
}
