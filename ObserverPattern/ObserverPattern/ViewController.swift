//
//  ViewController.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let dustMeter = DustMeter()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 관찰자
        let user1 = Subscriber(name: "만수")
        let user2 = Subscriber(name: "소연")
        let _ = Subscriber(name: "만동")
        
        // 알림을 받을 유저 추가
        dustMeter.addObserver(user1)
        dustMeter.addObserver(user2)
        
        // 알림을 더이상 받지 않을 유저
        dustMeter.removeObserver(user1)
    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpButton(_ sender: Any) {
        dustMeter.temperature = 32
        dustMeter.density = 80
        
        dustMeter.notify()
    }
}

