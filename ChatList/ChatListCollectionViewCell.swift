//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 윤태웅 on 9/29/23.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(_ chat:Chat){
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = chat.date
    }
    
}
