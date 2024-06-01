//
//  ChatListViewController.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/1/24.
//

import UIKit

class ChatListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let list = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
    }
    
    
}

extension ChatListViewController: setupUI {
    func setupNavigation() {
        navigationItem.title = "채팅 목록"
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let xib = UINib(nibName: ChatListTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChatListTableViewCell.identifier)
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
    }
}


extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.identifier, for: indexPath) as? ChatListTableViewCell else { return UITableViewCell() }
        cell.configureCell(list[indexPath.row])
        return cell
    }
    
    
}
