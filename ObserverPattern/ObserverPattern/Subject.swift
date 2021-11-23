//
//  Subject.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/23.
//

import Foundation

class Subject {
    private var observers: [Observer] = [Observer]()
    private var value: Int = Int()
    
    // 변경되면 notify()를 호출
    var number: Int {
        set {
            value = newValue
            notify()
        }
        get {
            return value
        }
    }
    
    // 옵저버 등록
    func attachObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    // 옵저버 알림
    func notify() {
        for observer in observers {
            observer.update(number)
        }
    }
}
