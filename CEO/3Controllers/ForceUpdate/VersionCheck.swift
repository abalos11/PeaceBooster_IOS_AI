//
//  VersionCheck.swift
//  CEO
//
//  Created by SD on 23/06/2025.
//

import UIKit
import Firebase

class VersionCheck {

    static func checkForForcedUpdate() {
        FirebaseAPI.getFirebaseData(url: FirebaseAPI.Constants.settings, source: .server) { (settings: AppSettings) in
            
            appSettings = settings
            
            let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
            
            if isVersion(currentVersion, lessThan: settings.minimumRequiredVersion) {
                DispatchQueue.main.async {
                    showForceUpdateAlert(appStoreID: settings.appStoreID)
                }
            }
        } changed: { (_) in } noData: { }
    }

    private static func showForceUpdateAlert(appStoreID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "ForceUpdateVC") as? ForceUpdateVC else { return }
        
        WindowManager.shared.show(controller, animated: true, withReset: true)
    }

    // مقارنة بين نسختين بصيغة "1.5.0"
    private static func isVersion(_ current: String, lessThan required: String) -> Bool {
        let currentComponents = current.split(separator: ".").map { Int($0) ?? 0 }
        let requiredComponents = required.split(separator: ".").map { Int($0) ?? 0 }
        
        let maxCount = max(currentComponents.count, requiredComponents.count)
        
        for i in 0..<maxCount {
            let currentValue = i < currentComponents.count ? currentComponents[i] : 0
            let requiredValue = i < requiredComponents.count ? requiredComponents[i] : 0

            if currentValue < requiredValue {
                return true
            } else if currentValue > requiredValue {
                return false
            }
        }
        
        return false
    }

}
