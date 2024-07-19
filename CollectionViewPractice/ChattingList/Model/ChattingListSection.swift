//
//  ChattingListSection.swift
//  TravlePractice
//
//  Created by 유철원 on 7/19/24.
//

import Foundation

enum ChattingListSection: CaseIterable {
    case base
    
    var krSection: String {
        return switch self {
        case .base:
            ""
        }
    }
    
    var contents: [ChatRoom] {
        return switch self {
        case .base:
            mockChatList
        }
    }
    
//    var list: [ChattingListCell] {
//        return self.contents.map{ ChattingListCell(text: $0) }
//    }
}
