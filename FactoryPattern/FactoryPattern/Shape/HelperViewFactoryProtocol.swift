//
//  HelperViewFactory.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import UIKit

let defaultHeight = 200
let defaultColor = UIColor.systemPink

protocol HelperViewFactoryProtocol {
    var height: Int { get }
    var view: UIView { get }
    var parentView: UIView { get }
    
    func configure()
    func position()
    func display()
}

class Square: HelperViewFactoryProtocol {
    let height: Int
    let parentView: UIView
    var view: UIView
    
    init(height: Int = defaultHeight, parentView: UIView) {
        self.height = height
        self.parentView = parentView
        view = UIView()
    }
    
    func configure() {
        let frame = CGRect(x: 0, y: 0, width: height, height: height)
        view.frame = frame
        view.backgroundColor = defaultColor
    }
    
    func position() {
        view.center = parentView.center
    }

    func display() {
        configure()
        position()
        parentView.addSubview(view)
    }
}

class Circle : Square {
    override func configure() {
        super.configure()
        
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
    }
    
}

class Rectangle : Square {
    override func configure() {
        let frame = CGRect(x: 0, y: 0, width: height + height/2, height: height)
        view.frame = frame
        view.backgroundColor = UIColor.blue
    }
    
}
