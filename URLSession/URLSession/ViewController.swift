//
//  ViewController.swift
//  URLSession
//
//  Created by soyeon on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    private let url = "https://randomuser.me/api/?results=20&inc=name,email,picture"
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserData()
    }
    
    private func getUserData() {
        let session = URLSession.shared
        
        guard let requestURL = URL(string: url) else { return }
        session.dataTask(with: requestURL) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                    self.users = userResponse.results
                    DispatchQueue.main.async {
                        dump(self.users)
//                        self.tableView.reloadData()
                    }
                } catch(let err) {
                    print(err.localizedDescription)
                }
            }
        }.resume()
    }
}

