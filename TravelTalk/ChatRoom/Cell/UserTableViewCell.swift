//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageLabel.numberOfLines = 0
    }
    
    func configureLayout() {
        
    }
    
    func configureCell(_ data: Chat) {
        dateLabel.text = data.date
        messageLabel.text = data.message
    }
}
