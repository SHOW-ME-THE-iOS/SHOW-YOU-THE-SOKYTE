//
//  SportswareFactory.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

class SportswareFactory {
    func makeSportsware(brand: BrandType) {
        let shoseFactory = BrandShoseFactory()
        let tshirtFactory = BrandTshirtFactory()
        
        shoseFactory.makeShose(brand: brand)
        tshirtFactory.makeTshirt(brand: brand)
    }
}
