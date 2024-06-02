//
//  ChatListTableViewCell.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/1/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatRoomLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    

    func configureLayout() {
        chatRoomLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            
        chatLabel.font = UIFont.systemFont(ofSize: 14)
        chatLabel.textColor = .gray
        
        userImageView.configureProfileImageView()
        
        dateLabel.descText()
    }
    
    func configureCell(_ data: ChatRoom) {
        userImageView.image = UIImage(named: data.chatroomImage[0])
        
        chatRoomLabel.text = data.chatroomName
        
        chatLabel.text = data.chatList.last?.message
        
        let date = data.chatList.last?.date.components(separatedBy: " ")[0]
        dateLabel.text = dateFormat(date!)
    }
    
    func dateFormat(_ lastDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let date = dateFormatter.date(from: lastDate) else { return "" }
        dateFormatter.dateFormat = "YY.MM.dd"
        let result = dateFormatter.string(from: date)
        return result
    }
}
