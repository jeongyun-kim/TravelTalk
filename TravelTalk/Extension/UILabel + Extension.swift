//
//  UILabel + Extension.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

extension UILabel {
    func descText(size: CGFloat = 12) {
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = .lightGray
    }
    
    func configureChatLabel() {
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 14)
    }
}
