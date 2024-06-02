//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        messageLabel.configureChatLabel()
        messageView.configureChatView()
        dateLabel.descText()
        self.selectionStyle = .none
    }
    
    func configureCell(_ data: Chat) {
        dateLabel.text = dateFormatted(str: data.date)
        messageLabel.text = data.message
    }
    
    func dateFormatted(str: String) -> String {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "YYYY-MM-dd HH:mm"
        let date = dateFormmater.date(from: str)
        dateFormmater.locale = Locale(identifier: "ko-KR")
        dateFormmater.dateFormat = "HH:mm a"
        let result = dateFormmater.string(from: date!)
        return result
    }
}
