//
//  SplashVC.swift
//  CEO
//
//  Created by iStart17 on 2/20/21.
//

import UIKit

class SplashVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "LanguageVC") as? LanguageVC {
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: false, completion: nil)
            }
        }
    }
}
