//
//  NoDataView.swift
//  Diwan
//
//  Created by Khaled Khaldi on 8/29/19.
//  Copyright © 2019 AphaTeam. All rights reserved.
//

import UIKit

class NoDataView: UIView {

    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    var handler: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    fileprivate func setup() {

    }
    
    @IBAction func reload(_ sender: Any) {
        handler?()
    }
    
    func configure(with title: String? = nil, text: String? = nil, image: UIImage? = nil, reloadTitle: String? = nil, reloadHandler: (()->())? = nil) {
        
        // Reload Button
        reloadButton.isHidden = (reloadHandler == nil)
        handler = reloadHandler
        
        if let title = title {
            titleLabel.text = title
        }
        if let text = text {
            textLabel.text = text
        }
        if let image = image {
            emptyImage.image = image
        }
        if let reloadTitle = reloadTitle {
            reloadButton.setTitle(reloadTitle, for: .normal)
        }

    }
    
}

extension UIView {
    
    @discardableResult
    func toggleNoDataView(_ show: Bool, title: String? = nil, text: String? = nil, image: UIImage? = nil, reloadTitle: String? = nil, reloadHandler: (()->())? = nil) -> NoDataView? {
        let tag = 876156
        if show {
            
            var tempView: NoDataView! = self.viewWithTag(tag) as? NoDataView
            if tempView == nil {
                tempView = NoDataView.fromNib()
                tempView.translatesAutoresizingMaskIntoConstraints = false
                tempView.tag = tag
                self.addSubview(tempView)
                
                let guide = safeAreaLayoutGuide
                
                NSLayoutConstraint.activate([
                    tempView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
                    tempView.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: -50),
                    // tempView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 50)
                    tempView.leadingAnchor.constraint(greaterThanOrEqualTo: guide.leadingAnchor, constant: 50)
                    ])
            }

            //UIViewController.noDataView = tempView
            
            tempView.isHidden = false
            
            tempView.configure(with: title, text: text, image: image, reloadTitle: reloadTitle, reloadHandler: reloadHandler)
            
            /*
            UIView.animate(withDuration: 0.2) {
                tempView.alpha = 1.0
            }
            */
            
            return tempView
            
        } else {
            guard let noDataView = self.viewWithTag(tag) as? NoDataView else { return nil }

            /*
            UIView.animate(withDuration: 0.2, animations: {
                noDataView.alpha = 0.0

            }) { (finished) in
            */
                noDataView.isHidden = true
            /*
            }
            */

            return noDataView

        }
        
    }

}

extension UIViewController {
    
    //private static var noDataView: NoDataView!
    @discardableResult
    func toggleNoDataView(_ show: Bool, title: String? = nil, text: String? = nil, image: UIImage? = nil, reloadTitle: String? = nil, reloadHandler: (()->())? = nil) -> NoDataView? {
        
        view.toggleNoDataView(show, title: title, text: text, image: image, reloadTitle: reloadTitle, reloadHandler: reloadHandler)
        
    }
}
