//
//  Product.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

// MARK: - Shose Product

protocol Shose {
    func getName()
}

class NikeShose: Shose {
    func getName() {
        print("Nike Shose")
    }
}

class AddidasShose: Shose {
    func getName() {
        print("Addidas Shose")
    }
}

// MARK: - T Shirt Product

protocol Tshirt{
    func getName()
}

class NikeTshirt: Tshirt {
    func getName() {
        print("Nike T-Shirt")
    }
}

class AddidasTshirt: Tshirt {
    func getName()  {
        print("Addidas T-Shirt")
    }
}
