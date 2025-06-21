//
//  SideMenuViewController.swift
//  Kastelli
//
//  Created by SD on 19/02/2025.
//

import UIKit
import SideMenu

extension NSNotification.Name {
    static let showCategories = NSNotification.Name(rawValue: "showCategories")
}

class SideMenuViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var data: [MenuItem] = { [weak self] in
        guard let self = self else { return [] }
        var array = [
            MenuItem(title: "Articles".localized, selected: false, action: { (indexPath) in
                let controller = ArticlesVC.instantiate()
                self.navigationController?.pushViewController(controller, animated: true)
            }),
            
            MenuItem(title: "Videos".localized, selected: false, action: { (indexPath) in
                let controller = VideosVC.instantiate()
                self.navigationController?.pushViewController(controller, animated: true)
            }),
            
            MenuItem(title: "FAQ".localized, selected: false, action: { (indexPath) in
                let controller = FAQsVC.instantiate()
                self.navigationController?.pushViewController(controller, animated: true)
            }),
            
            MenuItem(title: "Share".localized, selected: false, action: { (indexPath) in
                self.share()
            })
        ]
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func share() {
        let text = "Download app from apple store."
        let myWebsite = NSURL(string:"https://apps.apple.com/us/app/peace-booster/id1553664312")
        let shareAll = [text, myWebsite!] as [Any]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
    }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.registerCell(id: MenuItemTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuItemTableCell = tableView.dequeueTVCell()
        cell.configure(with: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        item.action?(indexPath)
    }
}

extension UIViewController {
    static func showSideMenuVC (_ viewController : UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let menuVC = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
        
        if Language.current.isRTL {
            SideMenuManager.default.rightMenuNavigationController = menuVC
        } else {
            SideMenuManager.default.leftMenuNavigationController = menuVC
        }
        
        let appScreenRect = UIWindow().bounds
        let minimumSize = min(appScreenRect.width, appScreenRect.height)
        let width = min(round(minimumSize * 0.9), 300)
        
        menuVC.settings.menuWidth = width
        menuVC.presentationStyle = .menuSlideIn
        if Language.current.isRTL {
            viewController.present(SideMenuManager.default.rightMenuNavigationController!,
                                   animated: true,
                                   completion: nil)
        } else {
            viewController.present(SideMenuManager.default.leftMenuNavigationController!,
                                   animated: true,
                                   completion: nil)
        }
    }
}
