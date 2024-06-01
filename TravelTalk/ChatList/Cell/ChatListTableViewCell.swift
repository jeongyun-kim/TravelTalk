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
    
    let imageNames: [String] = ["피카츄", "미뇽", "커비", "메타나이트", "디디", "잠자는커비"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    func configureLayout() {
        chatRoomLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            
        chatLabel.font = UIFont.systemFont(ofSize: 14)
        chatLabel.textColor = .gray
        
        userImageView.layer.cornerRadius = 35
        userImageView.contentMode = .scaleAspectFill
        userImageView.backgroundColor = .white
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
    }
    
    func configureCell(_ data: ChatRoom) {
        let randomImage = imageNames.randomElement()!
        userImageView.image = UIImage(named: randomImage)
        
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
