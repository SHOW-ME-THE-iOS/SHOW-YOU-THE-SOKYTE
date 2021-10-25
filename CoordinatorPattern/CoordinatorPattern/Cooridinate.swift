//
//  Cooridinate.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import Foundation

protocol Coordinator : class {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
