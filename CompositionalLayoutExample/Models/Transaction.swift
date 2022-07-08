//
//  Transaction.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import Foundation

struct Transaction: Hashable {
    enum `Type`: Hashable {
        case buy
        case sell
    }

    let coin: Coin
    let amount: Double
    let type: `Type`
}
