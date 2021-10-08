//
//  CellData.swift
//  CustomTransition
//
//  Created by soyeon on 2021/10/08.
//

import Foundation

class DataManager {

    private init() {}

    static let data: [CellData] = [
        .init(image: #imageLiteral(resourceName: "8"), title: "Seychelles"),
        .init(image: #imageLiteral(resourceName: "1"), title: "Königssee"),
        .init(image: #imageLiteral(resourceName: "2"), title: "Zanzibar"),
        .init(image: #imageLiteral(resourceName: "4"), title: "Serengeti"),
        .init(image: #imageLiteral(resourceName: "7"), title: "Castle"),
        .init(image: #imageLiteral(resourceName: "6"), title: "Kyiv"),
        .init(image: #imageLiteral(resourceName: "2"), title: "Munich"),
        .init(image: #imageLiteral(resourceName: "5"), title: "Lake")
    ]

}

