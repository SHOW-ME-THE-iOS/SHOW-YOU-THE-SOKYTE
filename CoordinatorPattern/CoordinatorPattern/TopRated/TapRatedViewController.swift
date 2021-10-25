//
//  TapRatedViewController.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

class TopRatedViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: TopRatedFlow?
    
    let showDetailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemOrange
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.orange.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(showDetailTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    // MARK: - Actions
    
    @objc
    func showDetailTapped(_ sender: UIButton) {
        coordinator?.coordinateToDetail()
    }
}

// MARK: - UI Methods

extension TopRatedViewController {
    private func initUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(showDetailButton)
        
        NSLayoutConstraint.activate([
            showDetailButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            showDetailButton.heightAnchor
                .constraint(equalToConstant: 50),
            showDetailButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            showDetailButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
