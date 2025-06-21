//
//  UIViewController+Keyboard.swift
//  OkApp
//
//  Created by Khaled Khaldi on 10/9/19.
//  Copyright © 2019 Master Work. All rights reserved.
//

import UIKit

extension UIViewController {
    
    @objc var bottomConstraintForKeyboard: NSLayoutConstraint? { return nil }
    
    @objc func didFinishHidingKeyboard() { }
    
    @objc func didFinishShowingKeybard() { }
    
    
    open func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    // MARK: - Keyboard
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let bottomConstraint = bottomConstraintForKeyboard else { return }

        guard
            let userInfo = notification.userInfo,
            // let keyboardSize = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size,
            let offset = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
                return
        }
        
//        let bottom = tabBarController?.tabBar.frame.size.height ?? 0
        
        let delay = 0.0 //0.01
        UIView.animate(withDuration: duration-delay, delay: delay, options: UIView.AnimationOptions(rawValue: curve), animations: { [weak self] in
            bottomConstraint.constant = (-offset.height)
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] (_) in
            self?.didFinishShowingKeybard()
        })
        
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let bottomConstraint = bottomConstraintForKeyboard else { return }
        
        guard
            bottomConstraint.constant != 0,
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {
                return
        }

        let delay = 0.0 //0.01
        UIView.animate(withDuration: duration-delay, delay: delay, options: UIView.AnimationOptions(rawValue: curve), animations: { [weak self] in
            bottomConstraint.constant = 0
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] (_) in
            self?.didFinishHidingKeyboard()
        })

    }

}
