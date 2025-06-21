//
//  API.swift
//  wieelz
//
//  Created by SaadiDalloul on 27/12/2021.
//

import UIKit

private let appleLanguagesKey = "AppleLanguages"

enum Language: String {
    case `default` = "_"
    case english = "en"
    case arabic = "ar"
    case chinese = "zh-Hans"
    case hebrew = "he"
    
    var semantic: UISemanticContentAttribute {
        switch self {
        case .default:
            return .unspecified
        case .arabic, .hebrew:
            return .forceRightToLeft
        default:
            return .forceLeftToRight
        }
    }
    
    var isRTL: Bool {
        switch self {
        case .arabic, .hebrew:
            return true
        default:
            return false
        }
    }
    
    var name: String {
        return Locale.current.localizedString(forIdentifier: self.rawValue) ?? self.rawValue
    }
    
    static var current: Language {
        get {
            if let languageCode = UserDefaults.standard.string(forKey: appleLanguagesKey),
                let language = Language(rawValue: languageCode) {
                return language
                
            } else {
                
                let preferredLanguage = NSLocale.preferredLanguages[0]
                let index = preferredLanguage.index(preferredLanguage.startIndex, offsetBy: 2)
                
                if let localization = Language(rawValue: preferredLanguage) {
                    return localization
                    
                } else if let localization = Language(rawValue: String(preferredLanguage[..<index])) {
                    return localization
                    
                } else {
                    return Language.english
                    
                }
                    
            }

        }
        
        set {
            guard current != newValue else { return }
            
            if newValue == .default {
                UserDefaults.standard.removeObject(forKey: appleLanguagesKey)
                UserDefaults.standard.synchronize()

            } else {
                // change language in the app
                // the language will be changed after restart
                UserDefaults.standard.set([newValue.rawValue], forKey: appleLanguagesKey)
                UserDefaults.standard.synchronize()
                
            }

            //Changes semantic to all views
            //this hack needs in case of languages with different semantics: leftToRight(en/uk) & rightToLeft(ar)
            UIView.appearance().semanticContentAttribute = Language.current.semantic
            UIView.appearance(whenContainedInInstancesOf: [UICollectionViewCell.self]).semanticContentAttribute = .unspecified

            //initialize the app from scratch
            //show initial view controller
            //so it seems like the is restarted
        }
    }

}
