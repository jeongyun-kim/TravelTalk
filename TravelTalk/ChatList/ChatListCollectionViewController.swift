//
//  ChatListCollectionViewController.swift
//  TravelTalk
//
//  Created by 김정윤 on 7/18/24.
//

import UIKit
import SnapKit

enum Section: Int, CaseIterable {
    case main
}

final class ChatListCollectionViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    private var dataSource: UICollectionViewDiffableDataSource<Section, ChatRoom>!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupUI()
        setupNavigation()
        configureDataSource()
        updateSnapshot()
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigation() {
        navigationItem.title = "채팅 목록"
    }
    
    private func layout() -> UICollectionViewLayout {
        // ListConfiguration 생성
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        // 구분선 없애기
        config.showsSeparators = false
        // 레이아웃으로 구성
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    private func configureDataSource() {
        let size = 65
        let padding:CGFloat = 12
        // Cell Registration으로 Cell 구성 및 등록
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, ChatRoom>!
        
        registration = UICollectionView.CellRegistration(handler: { cell, indexPath, item in
            var content = UIListContentConfiguration.sidebarSubtitleCell()
            
            guard let imageName = item.chatroomImage.first, let chat = item.chatList.last else { return }
            content.image = UIImage(named: imageName)
            content.imageProperties.maximumSize = CGSize(width: size, height: size)
            content.imageToTextPadding = padding
            
            content.secondaryText = chat.message // msg
            content.text = item.chatroomName // title
            content.textProperties.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14)
            
            cell.contentConfiguration = content
        })
        
        // cellForItemAt 대체
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            // using: Cell 구성
            // for: index
            // item: Cell로 보여줄 데이터
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
            return cell
        })
    }
    
    private func updateSnapshot() {
        // 현재의 스냅샷
        var snapshot = dataSource.snapshot()
        // 섹션 추가
        snapshot.appendSections(Section.allCases)
        // 아이템 추가
        snapshot.appendItems(mockChatList, toSection: .main)
        // 스냅샷 전송
        dataSource.apply(snapshot)
    }
}
