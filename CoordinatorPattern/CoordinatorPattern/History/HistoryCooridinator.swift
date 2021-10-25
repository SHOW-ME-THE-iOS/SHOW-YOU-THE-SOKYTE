//
//  HistoryCooridinator.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

protocol HistoryFlow {
    func coordinateToDetail(with title: String)
}

class HistoryCoordinator: Coordinator, HistoryFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let historyViewController = HistoryViewController()
        historyViewController.coordinator = self
        
        navigationController?.pushViewController(historyViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail(with title: String) {
        let historyDetailCoordinator = HistoryDetailCoordinator(
            navigationController: navigationController!,
            historyItemTitle: title
        )
        
        coordinate(to: historyDetailCoordinator)
    }
    
}
