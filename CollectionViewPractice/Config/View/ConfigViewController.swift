//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 유철원 on 7/18/24.
//

import UIKit

final class ConfigViewController: BaseViewController<ConfigView,ConfigViewModel>{

    typealias CellType = ConfigCell
    
    struct ConfigCell: Hashable {
        let identifier = UUID()
        let text: String
    }
    
    enum ConfigSection: CaseIterable {
        case allConfiguration
        case privateConfigration
        case etc
        
        var krSection: String {
            return switch self {
            case .allConfiguration:
                "전체 설정"
            case .privateConfigration:
                "개인 설정"
            case .etc:
                "기타"
            }
        }
        
        private var contents: [String] {
            return switch self {
            case .allConfiguration:
                ["공지사항", "실험실", "버전정보"]
            case .privateConfigration:
                ["개인/보안", "알림", "채팅", "멀티프로필", "멀티프로필"]
            case .etc:
                ["고객센터/도움말"]
            }
        }
        
        var list: [ConfigCell] {
            return self.contents.map{ ConfigCell(text: $0) }
        }
    }
    
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

