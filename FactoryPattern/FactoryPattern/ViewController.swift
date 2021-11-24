//
//  ViewController.swift
//  FactoryPattern
//
//  Created by soyeon on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = Client(brand: .nike)
    }
    
    @IBAction func drawCircle(_ sender: Any) {
        createShape(.circle, on: view)
    }
    
    @IBAction func drawSquare(_ sender: Any) {
        createShape(.square, on: view)
        
    }
    
    @IBAction func drawRectangle(_ sender: Any) {
        let rectangle = getShape(.rectangle, on: view)
        rectangle.display()
    }
}
