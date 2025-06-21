//
//  StartVC.swift
//  CEO
//
//  Created by iStart17 on 1/20/21.
//

import UIKit
import SafariServices

class StartVC: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPreference: UILabel!
    @IBOutlet weak var btnEmptiness: UIButton!
    
    let strPre = "This App is based on Nāgārjuna's discovery of how everything exists"
    let linkAtt:[NSAttributedString.Key: Any] = [.foregroundColor : UIColor.systemGreen,
                                                 .underlineStyle: NSUnderlineStyle.single.rawValue,
                                                 .font : UIFont.systemFont(ofSize: 18)]
    
    var attributedLinkString1 = NSMutableAttributedString()
    var attributedLinkString2 = NSMutableAttributedString()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = Constants.APPNAME
        setLinkable()
        // addNameOfPicture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func setLinkable() {
        // Tap gesture recognizers
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.linkTapped))
        lblPreference.addGestureRecognizer(tapGesture)
        
        let plainString1 = NSMutableAttributedString(string: "This App is based on ", attributes: nil)
        attributedLinkString1 = NSMutableAttributedString(string: "Nāgārjuna's", attributes: linkAtt)
        let plainString2 = NSMutableAttributedString(string: " discovery of how everything exists, ", attributes: nil)
        
        let plainString3 = NSMutableAttributedString(string: "this insight is called ", attributes: nil)
        attributedLinkString2 = NSMutableAttributedString(string: "Emptiness", attributes: linkAtt)
        // let plainString4 = NSMutableAttributedString(string: " of individual existence.", attributes: nil)
        
        let fullAttributedString = NSMutableAttributedString()
        
        fullAttributedString.append(plainString1)
        fullAttributedString.append(attributedLinkString1)
        fullAttributedString.append(plainString2)
        
        lblPreference.isUserInteractionEnabled = true
        lblPreference.attributedText = fullAttributedString
        
        let buttonAttString = NSMutableAttributedString()
        buttonAttString.append(plainString3)
        buttonAttString.append(attributedLinkString2)
//        buttonAttString.append(plainString4)
        btnEmptiness.setAttributedTitle(buttonAttString, for: .normal)
    }
    
    /*
    fileprivate func addNameOfPicture() {
        let alert = UIAlertController(title: "Enter Names", message: nil, preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Name the Person in the Photo"
        }
        
        alert.addTextField { field in
            field.placeholder = "What is your name?"
        }
        
        let addAction = UIAlertAction(title: "OK", style: .default) { [unowned alert] _ in
            guard let personName = alert.textFields?[0].text?.trim(), !personName.isEmpty,
                  let yourName = alert.textFields?[1].text?.trim(), !yourName.isEmpty else {
                      
                self.showToast("Please fill in both fields")
                self.addNameOfPicture()
                return
            }
            
            g_personName = personName
            g_userName = yourName
        }
        
        alert.addAction(addAction)
        alert.view.tintColor = .link
        present(alert, animated: true)
    }
    */
    
    @IBAction func showMenu(_ sender: Any) {
        StartVC.showSideMenuVC(self)
    }
    
    @IBAction func onOk(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "IntroVC") as! IntroVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func linkTapped(sender:UITapGestureRecognizer) {
        
        onWikiLinkTapped()
    }
    
    func onWikiLinkTapped() {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Nagarjuna") {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func onLionTapped(_ sender: Any) {
        if let url = URL(string: "https://www.lionsroar.com/the-fullness-of-emptiness/") {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
    
}
