//
//  ArticleDetailsVC.swift
//  CEO
//
//  Created by SD on 06/06/2025.
//

import UIKit

class ArticleDetailsVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    private func updateUI() {
        guard let item else { return }
        titleLabel.text = item.title
        if let imageUrl = item.imageUrl {
            articleImageView.sd_setImage(with: URL(string: imageUrl))
        }
        descriptionLabel.text = item.description
    }
}

extension ArticleDetailsVC: Storyboarded {
    static var storyboardName: StoryboardName = .main
}
