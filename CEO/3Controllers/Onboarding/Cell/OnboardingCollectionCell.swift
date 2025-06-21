//
//  OnboardingCollectionCell.swift
//  WCWC
//
//  Created by SD on 14/05/2025.
//  Copyright © 2025 iStart17. All rights reserved.
//

import UIKit

struct Onboarding: Codable {
    var image: String
    var topTitle: String?
    var title: String
    var subTitle: String
}

class OnboardingCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with data: Onboarding) {
        cellImageView.image = UIImage(named: data.image)
        topTitleLabel.text = data.topTitle
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
    }
}
