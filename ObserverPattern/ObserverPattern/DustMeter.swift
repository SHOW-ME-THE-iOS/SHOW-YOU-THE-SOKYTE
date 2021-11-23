//
//  DustMeter.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

class DustMeter: Publisher {
    var temperature: Float = 0.0
    var density: Float = 0.0
    
    func notify() {
        for observer in observers {
            observer.update(temperature, density: density)
        }
    }
}
