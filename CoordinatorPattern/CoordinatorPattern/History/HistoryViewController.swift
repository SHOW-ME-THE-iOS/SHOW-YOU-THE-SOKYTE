//
//  HistoryViewController.swift
//  CoordinatorPattern
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    // MARK: - Properties
    var coordinator: HistoryFlow?
    
    let historyItems: [HistoryItem] = [.init(title: "First item"),
                                       .init(title: "Second item"),
                                       .init(title: "Third item"),
                                       .init(title: "Fourth item")]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}

// MARK: - UI Methods

extension HistoryViewController {
    private func initUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor
                .constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor
                .constraint(equalTo: self.view.heightAnchor)
        ])
    }
}

// MARK: - UITableView Delegate, Data Source

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = historyItems[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToDetail(with: historyItems[indexPath.row].title)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


