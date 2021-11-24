//
//  Factory.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

enum BrandType {
    case nike
    case addidas
}

protocol ShoseFactory {
    func makeShose(brand: BrandType)
}

class BrandShoseFactory: ShoseFactory {
    func makeShose(brand: BrandType){
        switch brand {
        case .nike:
            return NikeShose().getName()
        case .addidas:
            return AddidasShose().getName()
        }
    }
}


protocol TshirtFactory {
    func makeTshirt(brand: BrandType)
}

class BrandTshirtFactory: TshirtFactory {
    func makeTshirt(brand: BrandType) {
        switch brand {
        case .nike:
            return NikeTshirt().getName()
        case .addidas:
            return AddidasTshirt().getName()
        }
    }
}
