//
//  ConfigModel.swift
//  CollectionViewPractice
//
//  Created by 유철원 on 7/19/24.
//

import Foundation

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
