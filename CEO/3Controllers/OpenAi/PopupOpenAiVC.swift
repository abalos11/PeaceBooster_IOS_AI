//
//  PopupOpenAiVC.swift
//  WCWC
//
//  Created by SD on 19/05/2025.
//  Copyright © 2025 iStart17. All rights reserved.
//

import UIKit
import IQTextView

protocol PopupOpenAiVCDelegate {
    func popupOpenAiVC(_ controller: PopupOpenAiVC, message: String)
}

class PopupOpenAiVC: UIViewController {
    
    var delegate: PopupOpenAiVCDelegate?
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var textView: IQTextView!
    @IBOutlet weak var statusStackView: UIStackView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var rephraseQuestion: String?
    var isRephrase: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topTitleLabel.text = isRephrase ? "Rephrase by AI".localized : "Ask Peace Booster AI".localized
        textView.placeholder = "Ask about what you’re experiencing or what doesn’t make sense…".localized
        bgView.addTapGesture { [weak self] in
            guard let self else { return }
            self.dismiss()
        }
        
        if isRephrase, let question = rephraseQuestion {
            statusStackView.isHidden = false
            statusLabel.text = "Processing ...".localized
            
            ChatGPTService.shared.sendQuestion(question, isRephrase: isRephrase) { [weak self] result in
                guard let self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let answer):
                        self.textView.text = answer
                        self.statusStackView.isHidden = true
                        self.statusLabel.textColor = .label
                    case .failure(let error):
                        self.statusLabel.text = "An error occurred: \(error.localizedDescription)"
                        self.statusLabel.textColor = .red
                    }
                }
            }
        }
    }
    
    @IBAction func send(_ sender: Any) {
        guard let message = textView.text, !message.isEmpty else { return }
        delegate?.popupOpenAiVC(self, message: message)
    }
}
