//
//  FAQsVC.swift
//  CEO
//
//  Created by SD on 29/05/2025.
//

import UIKit

struct FAQs: Codable {
    var question: String
    var answer: String
}

class FAQsVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var items: [FAQs] = [
        FAQs(question: "1. What is Peace Booster App?", answer: "Peace Booster is a gentle, daily guide to help you move beyond conflict and stress, and discover the peace that lies at the heart of every situation. It’s not about adding something new—it’s about revealing the unity that was always there."),
        
        FAQs(question: "2. Who is Peace Booster App for?", answer: "Peace Booster is for anyone—whether you’re feeling stressed by daily life, searching for calm amidst chaos, or simply curious about a deeper way of seeing. This isn’t just for conflict zones; it’s also for the mind’s preconceived ideas and misconceptions."),
        
        FAQs(question: "3. Do I need to believe in anything for this to work?", answer: "No beliefs or faith are required. Peace Booster doesn’t ask you to accept ideas—it invites you to see beyond them. It’s a direct, experiential process of seeing what’s always been true yet somehow remains unnoticed by most."),
        
        FAQs(question: "4. Is this based on a religion or spiritual practice?", answer: "Peace Booster draws on nondual observable facts—a timeless insight into the oneness of all existence. While traditions like Advaita and Zen express similar truths, Peace Booster is designed to be accessible and universal—no labels or dogma."),
        
        FAQs(question: "5. What will I be doing each day?", answer: "Every day, you’ll be guided to pause and honestly look at the way you perceive existence, including your own, and notice how conflict or tension appears in your mind when faced with new, irrefutable facts. You’ll also see how it can dissolve when you recognize the illusions of separation. These short, practical sessions can be done anywhere, anytime."),
        
        FAQs(question: "6. How soon will I notice results?", answer: "Many people feel more ease and calm instantly. Others find the shift happens gradually, almost invisibly. There’s no timeline—just an invitation to trust your direct experience."),
        
        FAQs(question: "7. Can this help with anxiety or relationship stress?", answer: "Yes. Peace Booster helps reveal the hidden unity beneath all negativity, including conflict—within yourself, and in relationships. While it’s not therapy, many people say it brings relief from anxiety, tension, and emotional strain because of the brand-new way of understanding existence itself."),
        
        FAQs(question: "8. Will my personal data be kept private?", answer: "Absolutely. Peace Booster respects your privacy. We don’t track or store personal data, ensuring your experience stays private and secure.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "FAQs"
        setupTableView()
    }
    
}

extension FAQsVC: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.registerCell(id: FAQsTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: FAQsTableCell = tableView.dequeueTVCell()
        cell.titleLabel.text = items[indexPath.row].question.localized
        cell.subTitleLabel.text = items[indexPath.row].answer.localized
        return cell
    }
}

extension FAQsVC: Storyboarded {
    static var storyboardName: StoryboardName = .main
}
