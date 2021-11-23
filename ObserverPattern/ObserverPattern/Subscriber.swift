//
//  Subscriber.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

class Subscriber: Observer {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    func update(_ temp: Float, density: Float) {
        print("\(name)님, 오늘의 온도는 \(temp)이고 미세먼지 농도는 \(density)이에요 😇")
    }
}
