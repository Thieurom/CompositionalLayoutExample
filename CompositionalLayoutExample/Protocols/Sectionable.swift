//
//  Sectionable.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

protocol Sectionable: Hashable {
    associatedtype Item: Hashable
    var items: [Item] { get }
}
