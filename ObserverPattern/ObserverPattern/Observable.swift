//
//  Observable.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/24.
//

import Foundation

protocol Observable {
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
}

protocol Observer: AnyObject {
    func update(_ temp: Float, density: Float)
}
