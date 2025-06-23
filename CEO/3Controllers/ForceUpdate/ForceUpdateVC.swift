//
//  ForceUpdateVC.swift
//  CEO
//
//  Created by SD on 22/06/2025.
//

import UIKit

class ForceUpdateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forceUpdate(_ sender: Any) {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(appSettings?.appStoreID ?? "")") {
            UIApplication.shared.open(url)
        }
    }
}
