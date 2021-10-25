//
//  TabBarController.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//


import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    var coordinator: TabBarCoordinator?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.orange
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    }
}
