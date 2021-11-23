//
//  Observers.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/23.
//

import Foundation

class Sokyte: Observer {
    private var subject: Subject = Subject()
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attachObserver(self)
    }
    
    func update(_ notifyValue: Int) {
        print("Sokyte가 \(notifyValue) 값을 변경된 것을 인식하였습니다.")
    }
}

class Alice: Observer {
    private var subject: Subject = Subject()
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attachObserver(self)
    }
    
    func update(_ notifyValue: Int) {
        print("Alice가 \(notifyValue) 값으로 변경된 것을 인식하였습니다.")
    }
}
