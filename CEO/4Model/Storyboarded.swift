//
//  Storyboarded.swift
//  SDProject
//
//  Created by Saadi Dalloul on 08/31/20.
//  Copyright © 2020 Saadi Dalloul. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    case onboarding = "Onboarding"
    case main = "Main"
}

protocol Storyboarded {
    static var storyboardIdentifier: String { get }
    static var storyboardName: StoryboardName { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static var storyboardName: StoryboardName {
        return .main
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
