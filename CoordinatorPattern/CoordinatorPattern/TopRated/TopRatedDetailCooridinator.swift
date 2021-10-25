//
//  TopRatedDetailCooridinator.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

protocol TopRatedDetailFlow {
    func dismissDetail()
}

class TopRatedDetailCoordinator: Coordinator, TopRatedDetailFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedDetailViewController = TopRatedDetailViewController()
        topRatedDetailViewController.coordinator = self
        
        navigationController.present(topRatedDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
