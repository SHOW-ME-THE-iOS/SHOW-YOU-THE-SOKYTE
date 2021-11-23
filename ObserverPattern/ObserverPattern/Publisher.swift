//
//  Observation.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

class Publisher: Observable {
    var observers = [Observer]()
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers = observers.filter({ $0 !== observer })
    }
}
