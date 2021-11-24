//
//  Client.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

class Client {
    init(brand: BrandType) {
        let client = SportswareFactory()
        client.makeSportsware(brand: brand)
    }
}
