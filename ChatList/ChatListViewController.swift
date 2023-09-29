//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 윤태웅 on 9/29/23.
//

import UIKit

class ChatListViewController: UIViewController {

    // collectionView 만들기
    // 1. collectionViewCell을 구성한다.
    // 2. collectionView를 컨트롤러로 가져온다.
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 데이터의 갯수
    let chatList:[Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // data, presentation, layout
        
        // data&presentation을 어떤 객체에게 위임할지, self = ChatListViewController.
        collectionView.dataSource = self
        // layout을 어떤 객체에게 위임할지, self = ChatListViewController.
        collectionView.delegate = self
    }
}

//ChatListViewController는 UICollectionViewDataSource이라는 프로토콜을 준수할 것임~.
extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // collectionView의 표현되는 아이템 갯수 알려주기.
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // cell을 어떻게 표현할지 정의해서 알려줘야함.
        // return UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

// 레이아웃 프로토콜
extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    // collectionView에서 자동완성 중 size관련을 선택.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
