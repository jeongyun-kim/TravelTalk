//
//  ChatRoomViewController.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var ChatRoomData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
    }
}

// MARK: UI
extension ChatRoomViewController: setupUI {
    func setupNavigation() {
        navigationItem.title = ChatRoomData?.chatroomName
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: UserTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: UserTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
    
    
}

// MARK: TableViewExtension
extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chatRoomData = ChatRoomData else { return 0 }
        return chatRoomData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chat = ChatRoomData?.chatList[indexPath.row] else { return UITableViewCell() }
        
        if chat.user == .user {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
            cell.configureCell(chat)
            return cell
        }
        return UITableViewCell()
    }
}
