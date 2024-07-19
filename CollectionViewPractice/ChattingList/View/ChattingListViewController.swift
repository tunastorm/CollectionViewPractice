//
//  ChattingListViewController.swift
//  TravlePractice
//
//  Created by 유철원 on 7/19/24.
//

import UIKit

class ChattingListViewController: BaseViewController<ChattingListView, ChattingListViewModel> {
    
    typealias CellType = ChatRoom
    
    var dataSource: UICollectionViewDiffableDataSource<ChattingListSection, CellType>?

    override func viewDidLoad() {
        super.viewDidLoad()
        configDataSource()
        updateSnapShot()
    }
    
    func configDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, CellType>?
        registration = UICollectionView.CellRegistration{ cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.image = UIImage(named: itemIdentifier.chatroomImage.first!)
            content.text = itemIdentifier.chatroomName
            content.secondaryText = itemIdentifier.chatList.first?.message
            
            content.imageProperties.cornerRadius = 20
            content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
            content.textProperties.color = .black
            content.textProperties.font = .systemFont(ofSize: 12)
            content.textProperties.numberOfLines = 1
            content.secondaryTextProperties.color = .lightGray
            content.secondaryTextProperties.font = .systemFont(ofSize: 12)
            content.secondaryTextProperties.numberOfLines = 1
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .clear
//            var separatorConfig = UIListSeparatorConfiguration(listAppearance: .grouped)
//            separatorConfig.color = .systemGray5
            
            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: rootView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let registration else { return UICollectionViewCell() }
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func updateSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<ChattingListSection, CellType>()
        snapShot.appendSections(ChattingListSection.allCases)
        snapShot.appendItems(ChattingListSection.base.contents, toSection: .base)
        dataSource?.apply(snapShot)
    }
}
