//
//  PopUpIntroVC.swift
//  CEO
//
//  Created by SD on 21/06/2025.
//

import UIKit

protocol PopUpIntroVCDelegate {
    func popUpIntroVC(_ controller: PopUpIntroVC, personName: String, yourName: String)
}

class PopUpIntroVC: UIViewController {
    
    var delegate: PopUpIntroVCDelegate?

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var yourNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        innerView.layer.maskedCorners = [.leadingBottom, .trailingBottom]
    }
    
    @IBAction func ok(_ sender: Any) {
        guard let personName = personNameTextField.text?.trim(), !personName.isEmpty,
              let yourName = yourNameTextField.text?.trim(), !yourName.isEmpty else {
            self.showToast("Please fill in both fields".localized)
            return
        }
        
        delegate?.popUpIntroVC(self, personName: personName, yourName: yourName)
    }
}
