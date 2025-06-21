//
//  LanguageVC.swift
//  CEO
//
//  Created by SD on 25/05/2025.
//

import UIKit
import LanguageManager_iOS

class LanguageVC: UIViewController {

    @IBOutlet weak var englishBtn: UIButton!
    @IBOutlet weak var arabicBtn: UIButton!
    @IBOutlet weak var chineseBtn: UIButton!
    @IBOutlet weak var hebrewBtn: UIButton!
    
    private var selectedLanguage: Languages?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateUIAndApplyLanguage(_ language: Languages) {
//        Localizer.configure()
        selectedLanguage = language

        englishBtn.backgroundColor = language == .en ? UIColor(hex: "#FFCE4C") : .white
        arabicBtn.backgroundColor = language == .ar ? UIColor(hex: "#FFCE4C") : .white
        chineseBtn.backgroundColor = language == .zh ? UIColor(hex: "#FFCE4C") : .white
        hebrewBtn.backgroundColor = language == .he ? UIColor(hex: "#FFCE4C") : .white

        LanguageManager.shared.setLanguage(language: language) { _ in
            return OnboardingVC.instantiate()
        } animation: { view in
            view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            view.alpha = 0
        }
    }

    @IBAction func english(_ sender: Any) {
        Language.current = .english
        updateUIAndApplyLanguage(.en)
    }

    @IBAction func arabic(_ sender: Any) {
        Language.current = .arabic
        updateUIAndApplyLanguage(.ar)
    }

    @IBAction func chinese(_ sender: Any) {
        Language.current = .chinese
        updateUIAndApplyLanguage(.zhHans)
    }

    @IBAction func hebrew(_ sender: Any) {
        Language.current = .hebrew
        updateUIAndApplyLanguage(.he)
    }
}
