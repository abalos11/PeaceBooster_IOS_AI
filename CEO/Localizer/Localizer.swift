//
//  API.swift
//  wieelz
//
//  Created by SaadiDalloul on 27/12/2021.
//

import Foundation
import UIKit


extension UIApplication {
    class func isRTL() -> Bool{
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
}

class Localizer: NSObject {
    
    /// Configure localizer, this must be called @ application did finish launching
    class func configure() {
        
        MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))
        MethodSwizzleGivenClassName(cls: UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), overrideSelector: #selector(getter: UIApplication.cstm_userInterfaceLayoutDirection))
        MethodSwizzleGivenClassName(cls: UITextField.self, originalSelector: #selector(UITextField.layoutSubviews), overrideSelector: #selector(UITextField.cstmlayoutSubviews))
        MethodSwizzleGivenClassName(cls: UILabel.self, originalSelector: #selector(UILabel.layoutSubviews), overrideSelector: #selector(UILabel.cstmlayoutSubviews))

    }
    
}

extension UILabel {
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        if self.isKind(of: NSClassFromString("UITextFieldLabel")!) {
            return // handle special case with uitextfields
        }
        // Check
        if self.tag <= 0  {
            if UIApplication.isRTL()  {
                if textAlignment == .right || textAlignment == .center {
                    return
                }
            } else {
                if textAlignment == .left || textAlignment == .center {
                    return
                }
            }
        }
        
        // Act
        if self.tag <= 0 {
            if UIApplication.isRTL()  {
                textAlignment = .right
            } else {
                textAlignment = .left
            }
        }
    }
}


extension UITextField {
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        if self.tag <= 0 {
            if UIApplication.isRTL()  {
                if textAlignment == .right || textAlignment == .center { return }
                textAlignment = .right
//                if let selectedRange = selectedTextRange {
//                    let cursorPosition = offset(from: beginningOfDocument, to: selectedRange.start)
//                    print("\(cursorPosition)")
//                }
            } else {
                if textAlignment == .left || textAlignment == .center { return }
                textAlignment = .left
            }
        }
    }
}


//var numberoftimes = 0
extension UIApplication {
    @objc var cstm_userInterfaceLayoutDirection : UIUserInterfaceLayoutDirection {
        get {
            let direction: UIUserInterfaceLayoutDirection = Language.current.isRTL ? .rightToLeft : .leftToRight
            return direction
        }
    }
}

extension Bundle {
    @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
        if self == Bundle.main {
            let currentLanguage = Language.current.rawValue
            var bundle = Bundle()
           /*
            if let _path = Bundle.main.path(forResource: Language.currentAppleLanguageFull(), ofType: "lproj") {
                bundle = Bundle(path: _path)!
           
            } else
           */
            if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
                bundle = Bundle(path: _path)!
            
            } else {
                let _path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
                bundle = Bundle(path: _path)!
        
            }
            return (bundle.specialLocalizedStringForKey(key, value: value, table: tableName))
        
        } else {
            return (self.specialLocalizedStringForKey(key, value: value, table: tableName))
        }
    }
}

/*
func disableMethodSwizzling() {
    
}
*/


/// Exchange the implementation of two methods of the same Class
func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    guard let origMethod: Method = class_getInstanceMethod(cls, originalSelector),
        let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector) else {
            return
    }
    if class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod))
    } else {
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}
