//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 유철원 on 7/18/24.
//

import UIKit

final class ConfigViewController: BaseViewController<ConfigView,ConfigViewModel>{

    typealias CellType = ConfigCell
    
    var dataSource: UICollectionViewDiffableDataSource<ConfigSection, CellType>?

    override func viewDidLoad() {
        super.viewDidLoad()
        configDataSource()
        updateSnapShot()
    }
    
    func configDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, CellType>?
        registration = UICollectionView.CellRegistration{ cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.text
            content.textProperties.color = .lightGray
            content.textProperties.font = .systemFont(ofSize: 12)
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .clear
            var separatorConfig = UIListSeparatorConfiguration(listAppearance: .grouped)
            separatorConfig.color = .systemGray5
            
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
        var snapShot = NSDiffableDataSourceSnapshot<ConfigSection, CellType>()
        snapShot.appendSections(ConfigSection.allCases)
        snapShot.appendItems(ConfigSection.allConfiguration.list, toSection: .allConfiguration)
        snapShot.appendItems(ConfigSection.privateConfigration.list, toSection: .privateConfigration)
        snapShot.appendItems(ConfigSection.etc.list, toSection: .etc)
        dataSource?.apply(snapShot)
    }
}

