//
//  ShapeFactory.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import UIKit

enum Shapes {
    case square
    case circle
    case rectangle
}

class ShapeFactory {
    let parentView: UIView
    
    init(parentView: UIView) {
        self.parentView = parentView
    }
    
    func create(as shape: Shapes) -> HelperViewFactoryProtocol {
        switch shape {
        case .square:
            let square = Square(parentView: parentView)
            return square
        case .circle:
            let circle = Circle(parentView: parentView)
            return circle
        case .rectangle:
            let rectangle = Rectangle(parentView: parentView)
            return rectangle
        }
    }
}


func createShape(_ shape: Shapes, on view: UIView) {
    let shapeFactory = ShapeFactory(parentView: view)
    shapeFactory.create(as: shape).display()
    
}

func getShape(_ shape: Shapes, on view: UIView) -> HelperViewFactoryProtocol {
    let shapeFactory = ShapeFactory(parentView: view)
    return shapeFactory.create(as: shape)
}
