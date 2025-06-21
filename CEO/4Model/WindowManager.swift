//
//  ISWindowManager.swift
//  ISChat
//
//  Created by Saadi Dalloul on 9/20/18.
//  Copyright © 2018 Nawa. All rights reserved.
//

import UIKit

class WindowManager {
    
    // MARK: - Singleton
    
    class var shared: WindowManager {
        struct Static {
            static var instance: WindowManager? = nil
        }
        
        if Static.instance == nil {
            Static.instance = WindowManager()
        }
        
        return Static.instance!
    }
    
    public enum Window {
        case onboarding
        case main
        
        var controller: UIViewController {
            switch self {
            case .onboarding:
                return shared.onboardingController
            default:
                return shared.mainController
            }
        }
    }
    
    public func show(_ controller: UIViewController, animated: Bool, withReset reset: Bool) {
        if reset {
            resetControllers()
        }
        
        if animated {
            let options: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseIn]
            
            let overlayView = UIScreen.main.snapshotView(afterScreenUpdates: false)
            controller.view.addSubview(overlayView)
            sceneDelegate?.window?.rootViewController = controller
            UIView.animate(withDuration: 0.4, delay: 0.0, options: options, animations: {
                overlayView.alpha = 0
            }, completion: { (finished) in
                overlayView.removeFromSuperview()
            })
        } else {
            sceneDelegate?.window?.rootViewController = controller
        }
        
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    public func show(_ window: Window, animated: Bool, withReset reset: Bool) {
        show(window.controller, animated: animated, withReset: reset)
    }
    
    private init() {}
    
    fileprivate var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
    }
    //    fileprivate let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    fileprivate func resetControllers() {
        _onboardingController = nil
        _mainController = nil
    }
    
    fileprivate var _onboardingController: UIViewController!
    fileprivate var onboardingController: UIViewController {
        if _onboardingController == nil {
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            _onboardingController = storyboard.instantiateInitialViewController()!
        }
        return _onboardingController
    }
    
    fileprivate var _mainController: UIViewController!
    fileprivate var mainController: UIViewController {
        if _mainController == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            _mainController = storyboard.instantiateInitialViewController()!
        }
        return _mainController
    }
    
}
