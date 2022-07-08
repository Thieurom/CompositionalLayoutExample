//
//  TransactionViewModel.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import RxCocoa
import RxSwift

class TransactionViewModel: Hashable {
    static func == (lhs: TransactionViewModel, rhs: TransactionViewModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id: String
    let name: Driver<String>
    let amount: Driver<String>
    let iconName: Driver<String>

    init(_ transaction: Transaction) {
        id = transaction.coin.id
        name = .just(transaction.coin.name).asDriver()
        amount = .just("\(transaction.type.sign)$\(transaction.amount)").asDriver()
        iconName = .just(transaction.coin.id.lowercased()).asDriver()
    }
}

extension Transaction.`Type` {
    fileprivate var sign: String {
        switch self {
        case .buy: return "+"
        case .sell: return "-"
        }
    }
}
