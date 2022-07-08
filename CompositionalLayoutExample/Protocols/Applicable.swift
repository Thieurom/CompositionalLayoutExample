//
//  Applicable.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import Foundation

protocol Applicable {}

extension Applicable {

    @discardableResult
    func apply(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: Applicable {}
