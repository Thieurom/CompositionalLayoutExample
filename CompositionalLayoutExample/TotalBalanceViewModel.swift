//
//  TotalBalanceViewModel.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import Foundation
import RxCocoa

class TotalBalanceViewModel: Hashable {

    static func == (lhs: TotalBalanceViewModel, rhs: TotalBalanceViewModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id: String
    let title: Driver<String>
    let usdAmount: Driver<String>

    init(usdAmount: Double) {
        id = UUID().uuidString
        title = .just("Total Balance").asDriver()
        self.usdAmount = .just("$\(usdAmount)").asDriver()
    }
}
