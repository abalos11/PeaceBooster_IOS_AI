//
//  AppDelegate.swift
//  CEO
//
//  Created by iStart17 on 1/1/21.
//

import UIKit
import IQKeyboardToolbarManager
import IQKeyboardManagerSwift
import FirebaseCore
import LanguageManager_iOS

struct ApiKey: Codable {
    let apiKey: String
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Thread.sleep(forTimeInterval: 5) // to delay the launch screen
        
        IQKeyboardToolbarManager.shared.isEnabled = true
        IQKeyboardManager.shared.isEnabled = true
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        FirebaseApp.configure()
        
        LanguageManager.shared.defaultLanguage = .en
        Language.current = .english
        Localizer.configure()
        
        FirebaseAPI.getFirebaseData(url: FirebaseAPI.Constants.apiKey) { (key: ApiKey) in
            apiKey = key.apiKey
        } changed: { (_) in } noData: { }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

