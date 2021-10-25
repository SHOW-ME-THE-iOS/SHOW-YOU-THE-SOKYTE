//
//  HistoryDetailCoordinator.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/26.
//

import UIKit

protocol HistoryDetailFlow {
    func dismissDetail()
}

class HistoryDetailCoordinator: Coordinator, HistoryDetailFlow {
    
    let navigationController: UINavigationController
    let historyItemTitle: String
    
    init(navigationController: UINavigationController,
         historyItemTitle: String) {
        
        self.navigationController = navigationController
        self.historyItemTitle = historyItemTitle
    }
    
    func start() {
        let historyDetailViewController = HistoryDetailViewController()
        historyDetailViewController.historyItemTitle = historyItemTitle
        historyDetailViewController.coordinator = self
        
        navigationController.present(historyDetailViewController, animated: true, completion: nil)
    }
    
    // MARK: - Flow Methods
    
    func dismissDetail() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}
