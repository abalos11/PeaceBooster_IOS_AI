//
//  UIViewController+HUD.swift
//  ISChat
//
//  Created by Khaled Khaldi on 9/19/18.
//  Copyright © 2018 iPhoneAlsham. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showHUD(style: UIView.HUDStyle = .none, title: String? = nil, details: String? = nil, hideAfter: TimeInterval? = nil, completion: (() -> Void)? = nil) {
        view.showHUD(style: style, title: title, details: details, hideAfter: hideAfter, completion: completion)
    }

    func showIndeterminateHUD(title: String? = nil, details: String? = nil) {
        view.showIndeterminateHUD(title: title, details: details)
    }

    func showDeterminateHUD(title: String? = nil, details: String? = nil, progress: Float? = nil) {
        view.showDeterminateHUD(title: title, details: details) // Placeholder — not supported by UIActivityIndicatorView
    }

    func hideHUD(animated: Bool = true, afterDelay: TimeInterval = 0) {
        view.hideHUD(animated: animated, afterDelay: afterDelay)
    }
}

extension UIView {
    
    public enum HUDStyle {
        case success
        case error
        case warning
        case none
    }
    
    private var activityIndicatorTag: Int { return 999999 }

    func showHUD(style: HUDStyle = .none, title: String? = nil, details: String? = nil, hideAfter: TimeInterval? = nil, completion: (() -> Void)? = nil) {
        
        hideHUD() // remove any previous one

        let container = UIView(frame: bounds)
        container.backgroundColor = UIColor(white: 0, alpha: 0.5)
        container.tag = activityIndicatorTag
        container.isUserInteractionEnabled = true
        container.translatesAutoresizingMaskIntoConstraints = false

        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()

        container.addSubview(indicator)
        addSubview(container)

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            indicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        if let hideAfter = hideAfter {
            DispatchQueue.main.asyncAfter(deadline: .now() + hideAfter) {
                self.hideHUD()
                completion?()
            }
        }
    }

    func showIndeterminateHUD(title: String? = nil, details: String? = nil) {
        showHUD(style: .none, title: title, details: details)
    }

    func showDeterminateHUD(title: String? = nil, details: String? = nil) {
        // UIActivityIndicatorView does not support determinate progress
        showIndeterminateHUD(title: title, details: details)
    }

    func hideHUD(animated: Bool = true, afterDelay: TimeInterval = 0) {
        if afterDelay > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + afterDelay) {
                self.removeActivityIndicator()
            }
        } else {
            removeActivityIndicator()
        }
    }

    private func removeActivityIndicator() {
        viewWithTag(activityIndicatorTag)?.removeFromSuperview()
    }
}
