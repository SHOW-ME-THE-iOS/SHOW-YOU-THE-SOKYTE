//
//  ListTVC.swift
//  ResizingCell
//
//  Created by soyeon on 2021/10/13.
//

import UIKit

class ListTVC: UITableViewCell {
    static let identifier = "ListTVC"
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var memberSinceLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var seeMoreButton: UIButton!
    
    // MARK: - Properties
    
    private var isSeeLess = true
    private var seeMoreDidTapHandler: (() -> Void)?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction private func touchUpSeeMoreButton() {
        isSeeLess.toggle()
        descLabel.numberOfLines = self.isSeeLess ? 0 : 3
        descLabel.layoutIfNeeded()
        seeMoreButton.setTitle(self.isSeeLess ? "See less" : "See more", for: .normal)
        seeMoreDidTapHandler?()
    }
}

extension ListTVC {
    func initUI() {
        userNameLabel.font = UIFont.systemFont(ofSize: 17)
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        descLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    func initCell(_ review: Review) {
        userNameLabel.text = review.title
        memberSinceLabel.text = review.memberSince
        descLabel.text = review.description
        dateLabel.text = review.date
        
        isSeeLess = review.isExpanded
        descLabel.numberOfLines = self.isSeeLess ? 0 : 3
        seeMoreButton.setTitle(self.isSeeLess ? "See less" : "See more", for: .normal)
    }
}

extension ListTVC {
    func tapSeeMoreButton(_ handler: @escaping () -> Void) {
        seeMoreDidTapHandler = handler
    }
}
