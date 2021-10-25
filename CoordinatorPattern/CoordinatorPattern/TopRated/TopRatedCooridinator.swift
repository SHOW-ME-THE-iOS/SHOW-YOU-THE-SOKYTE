//
//  TopRatedCooridinator.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

protocol TopRatedFlow: AnyObject {
    func coordinateToDetail()
}

class TopRatedCoordinator: Coordinator, TopRatedFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedViewController = TopRatedViewController()
        topRatedViewController.coordinator = self
        
        navigationController?.pushViewController(topRatedViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    
    func coordinateToDetail() {
        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
        coordinate(to: topRatedDetailCoordinator)
    }
}
