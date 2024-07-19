//
//  ChattingView.swift
//  TravlePractice
//
//  Created by 유철원 on 7/19/24.
//

import UIKit
import SnapKit

final class ChattingListView: BaseView {
    
    private let createLayout: () -> UICollectionViewCompositionalLayout = {
        var configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        configuration.backgroundColor = .white
        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    
    override func configHierarchy() {
        addSubview(collectionView)
    }
    
    override func configLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configView() {
        
    }
    
}
