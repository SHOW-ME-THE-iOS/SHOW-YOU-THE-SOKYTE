//
//  ViewController.swift
//  ExpandableCell
//
//  Created by soyeon on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var customNaviBar: UIView!
    @IBOutlet weak var commentTableView: UITableView!
    
    private lazy var textField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        return field
    }()
    
    private lazy var backgroundView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        effectView.layer.cornerRadius = 8
        effectView.layer.cornerCurve = .continuous
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.clipsToBounds = true
        return effectView
    }()
    
    private lazy var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "btnGoup"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setTableView()
        setToolBar()
    }
}

extension ViewController {
    private func initUI() {
        view.addSubview(backgroundView)
        view.addSubview(upButton)
        
        backgroundView.contentView.addSubview(textField)
        
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            upButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            upButton.bottomAnchor.constraint(equalTo: backgroundView.contentView.topAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: backgroundView.contentView.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: backgroundView.contentView.trailingAnchor, constant: -8),
            textField.topAnchor.constraint(equalTo: backgroundView.contentView.topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: backgroundView.contentView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            view.keyboardLayoutGuide.topAnchor.constraint(
                equalTo: backgroundView.bottomAnchor,
                constant: 8
            )
        ])
    }
    
    private func setToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
                
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(done))
                
        toolbar.setItems([doneButton], animated: false)
                
        //toolbar를 넣고싶은 textField 및 textView 필자의 경우 recommendDataTextView
        textField.inputAccessoryView = toolbar
    }

    private func setTableView() {
        commentTableView.delegate = self
        commentTableView.dataSource = self
    }
}

extension ViewController {
    @objc
    func done() {
        self.view.endEditing(true)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
