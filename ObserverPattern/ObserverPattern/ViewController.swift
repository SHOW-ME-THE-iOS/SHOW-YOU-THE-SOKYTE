//
//  ViewController.swift
//  ObserverPattern
//
//  Created by soyeon on 2021/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subject = Subject()
        
        let sokyte = Sokyte(subject)
        sokyte.update(127)
        
        let alice = Alice(subject)
        alice.update(21)
    }
}

