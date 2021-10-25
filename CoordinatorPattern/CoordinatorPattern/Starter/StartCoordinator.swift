//
//  StartCoordinator.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

protocol StartFlow: AnyObject {
    func coordinateToTabBar()
}

class StartCoordinator: Coordinator, StartFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = StartViewController()
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
