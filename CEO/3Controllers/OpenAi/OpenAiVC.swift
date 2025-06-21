//
//  OpenAiVC.swift
//  WCWC
//
//  Created by SD on 17/05/2025.
//  Copyright © 2025 iStart17. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import IQTextView

struct Chat: Codable {
    enum ChatUser: String, Codable {
        case my
        case other
    }
    
    var id: Int
    var message: String
    var user: ChatUser
}

class OpenAiVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: IQTextView!
    @IBOutlet weak var accessoryBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var statusStackView: UIStackView!
    @IBOutlet weak var statusLabel: UILabel!
    
    private let sensitiveHandler = SensitiveContentHandler()
    private let topicFilter = TopicFilter()
    private var items: [Chat] = []
    var firstMessage: String?
    var isRephrase: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        textView.placeholder = "Ask about what you’re experiencing or what doesn’t make sense…".localized
        textView.text = firstMessage
        if isRephrase {
            sendQuestion(question: firstMessage ?? "", isRephrase: isRephrase)
        } else {
            sendMessage()
        }
        setupTableView()
        setupKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupKeyboard() {
        let manager = IQKeyboardManager.shared
//        manager.disabledToolbarClasses.append(type(of: self))
        manager.disabledDistanceHandlingClasses.append(type(of: self))
        manager.disabledTouchResignedClasses.append(type(of: self))
        
        addKeyboardObservers()

    }
    
    private func add(chat: Chat) {
        items.append(chat)
        let wasAtBottom = tableView.isAtBottom
        tableView.insertRows(at: [IndexPath(row: items.count-1, section: 0)], with: .automatic)
        if wasAtBottom {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.tableView.scrollToLastRow(animated: true)
            }
        }
    }

    @IBAction func send(_ sender: Any) {
        sendMessage()
    }
    
    private func sendMessage() {
        statusStackView.isHidden = true
        guard let question = textView.text, !question.isEmpty else { return }
        let message = Chat(id: items.count, message: question, user: .my)
        add(chat: message)

        if sensitiveHandler.containsSensitiveContent(question) {
            let response = sensitiveHandler.getSafeResponse(for: question)
            let message = Chat(id: items.count, message: response, user: .other)
            add(chat: message)
            textView.text = ""
            
        }
        /*
        else if topicFilter.isUnrelatedToMindDetox(question) {
            let message = Chat(id: items.count, message: "This topic seems unrelated to Mind Detox. Please ask a question related to your inner clarity or awareness.", user: .other)
            add(chat: message)
            textView.text = ""
        }
        */
        else {
            sendQuestion(question: question, isRephrase: false)
//            statusStackView.isHidden = false
//            statusLabel.text = "Processing..."
//            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
//                guard let self else { return }
//                self.textView.text = ""
//            }
//            ChatGPTService.shared.sendQuestion(question) { [weak self] result in
//                guard let self else { return }
//                DispatchQueue.main.async {
//                    switch result {
//                    case .success(let answer):
//                        self.add(chat: Chat(id: self.items.count, message: answer, user: .other))
//                        self.statusStackView.isHidden = true
//                        self.statusLabel.textColor = .label
//                    case .failure(let error):
//                        self.statusLabel.text = "An error occurred: \(error.localizedDescription)"
//                        self.statusLabel.textColor = .red
//                    }
//                }
//            }
        }
    }
    
    private func sendQuestion(question: String, isRephrase: Bool) {
        statusStackView.isHidden = false
        statusLabel.text = "Processing ...".localized
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
            guard let self else { return }
            self.textView.text = ""
        }
        ChatGPTService.shared.sendQuestion(question, isRephrase: isRephrase) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let answer):
                    let message = Chat(
                        id: self.items.count,
                        message: answer,
                        user: isRephrase ? .my : .other
                    )
                    
                    self.add(chat: message)
                    
                    if isRephrase, self.items.count == 1 {
                        self.sendQuestion(question: self.items[0].message, isRephrase: false)
                    }
                    
                    self.statusStackView.isHidden = true
                    self.statusLabel.textColor = .white
                case .failure(let error):
                    self.statusLabel.text = "An error occurred: \(error.localizedDescription)"
                    self.statusLabel.textColor = .red
                }
            }
        }
    }
}

extension OpenAiVC: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.registerCell(id: MyChatTableCell.identifier)
        tableView.registerCell(id: OtherChatTableCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if items[indexPath.row].user == .my {
            let cell: MyChatTableCell = tableView.dequeueTVCell()
            cell.messageLabel.text = items[indexPath.row].message
            return cell
        } else {
            let cell: OtherChatTableCell = tableView.dequeueTVCell()
            cell.messageLabel.text = items[indexPath.row].message
            return cell
        }
    }
}

extension OpenAiVC {
    override var bottomConstraintForKeyboard: NSLayoutConstraint? {
        return accessoryBottomConstraint
    }
    
    override func didFinishShowingKeybard() {
        tableView.setOffsetToBottom(animated: true)
        tableView.scrollToLastRow(animated: true)
    }
    
    override func didFinishHidingKeyboard() {
        
    }
}

extension UITableView {
    func scrollToLastRow(animated: Bool) {
        if self.numberOfRows(inSection: 0) > 0 {
            self.scrollToRow(at: IndexPath(row: self.numberOfRows(inSection: 0) - 1, section: 0),
                             at: .bottom,
                             animated: animated)
        }
    }
}

extension UIScrollView {
    var isAtTop: Bool  {
        let scrollOffset = contentOffset.y

        if scrollOffset == 0 {
            // then we are at the top
            return true
        }

        return false

    }

    var isAtBottom: Bool {
        let scrollViewHeight        = frame.size.height
        let scrollContentSizeHeight = contentSize.height
        let scrollOffset            = contentOffset.y

        if (scrollOffset + scrollViewHeight) - scrollContentSizeHeight >= -10 { // in 10 px range
            // then we are at the end
            return true
        }

        return false
    }

    func setOffsetToBottom(animated: Bool) {
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.frame.size.height), animated: true)
    }

}
