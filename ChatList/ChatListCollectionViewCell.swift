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
    
    // imageView corner radius 코드에서 적용하기
    /**
     -- awakeFromNib() 함수가 사용하기 전에 storyboard에서 꺼내오는 함수다. 여기서 세팅을 해주면 적용.
     
     override func awakeFromNib(){
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 40
     }
     */
    
    func configure(_ chat:Chat){
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        
        // String -> Date -> String
        // 2022-04-01 -> 1/4
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: dateString){
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
    
}
