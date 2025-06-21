//
//  VideosVC.swift
//  CEO
//
//  Created by SD on 29/05/2025.
//

import UIKit
import SafariServices

struct Video: Codable {
    let id: String
    let description: String?
    let videoId: String
    let createAt: Double?
}

class VideosVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var items: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        loadData()
    }
    
    private func loadData() {
        showIndeterminateHUD()
        FirebaseAPI.getFirebaseData(url: FirebaseAPI.Constants.videos) { [weak self] (video: Video) in
            guard let self = self else { return }
            self.items.append(video)
            self.tableView.reloadData()
            self.hideHUD()
            self.toggleNoDataView(items.isEmpty)
        } changed: { (video: Video) in
            self.hideHUD()
        } noData: {
            self.hideHUD()
            self.toggleNoDataView(true)
        }
    }
    
}

extension VideosVC: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.registerCell(id: VideosTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VideosTableCell = tableView.dequeueTVCell()
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoId = items[indexPath.row].videoId
        if let url = URL(string: "youtube://\(videoId)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else if let url = URL(string: "https://www.youtube.com/watch?v=\(videoId)") {
                let safariVC = SFSafariViewController(url: url)
                safariVC.preferredControlTintColor = .systemRed
                present(safariVC, animated: true, completion: nil)
            } else if let webURL = URL(string: "https://www.youtube.com/watch?v=\(videoId)") {
                // Fallback to Safari if YouTube app isn't available
                UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
            }
        }

    }
}

extension VideosVC: Storyboarded {
    static var storyboardName: StoryboardName = .main
}
