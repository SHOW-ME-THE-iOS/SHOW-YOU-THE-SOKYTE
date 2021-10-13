//
//  ViewController.swift
//  ResizingCell
//
//  Created by soyeon on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK: - Properties
    
    private var data: [Review] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setData()
    }
}

// MARK: - Custom Methods

extension ViewController {
    func setData() {
        for _ in 0...4 {
            self.data.append(Review())
        }
    }
    
    func setTableView() {
        listTableView.estimatedRowHeight = 200
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        let listNib = UINib(nibName: ListTVC.identifier, bundle: nil)
        listTableView.register(listNib, forCellReuseIdentifier: ListTVC.identifier)
    }
}

// MARK: - UITableView Delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableView DataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier) as? ListTVC else {
            return UITableViewCell()
        }
        cell.tapSeeMoreButton { [weak self] in
            self?.data[indexPath.row].isExpanded.toggle()
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        cell.initCell(self.data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

