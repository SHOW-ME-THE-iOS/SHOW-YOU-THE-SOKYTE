//
//  StartViewController.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: StartFlow?
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.systemTeal.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: -1, height: 3)
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
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
    func startTapped(_ sender: UIButton) {
        coordinator?.coordinateToTabBar()
    }
}

// MARK: - UI Methods

extension StartViewController {
    private func initUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        self.view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            startButton.heightAnchor
                .constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
