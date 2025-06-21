//
//  ArticlesVC.swift
//  CEO
//
//  Created by SD on 29/05/2025.
//

import UIKit

struct Article: Codable {
    let id: String
    let imageUrl: String?
    let title: String?
    let description: String?
    let createAt: Double?
}

class ArticlesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var items: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        loadData()
    }
    
    private func loadData() {
        showIndeterminateHUD()
        FirebaseAPI.getFirebaseData(url: FirebaseAPI.Constants.articles) { [weak self] (article: Article) in
            guard let self = self else { return }
            self.items.append(article)
            self.tableView.reloadData()
            self.hideHUD()
            self.toggleNoDataView(items.isEmpty)
        } changed: { (article: Article) in
            self.hideHUD()
        } noData: {
            self.hideHUD()
            self.toggleNoDataView(true)
        }
    }
}

extension ArticlesVC: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.registerCell(id: ArticlesTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticlesTableCell = tableView.dequeueTVCell()
        cell.titleLabel.text = items[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ArticleDetailsVC.instantiate()
        controller.item = items[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ArticlesVC: Storyboarded {
    static var storyboardName: StoryboardName = .main
}
