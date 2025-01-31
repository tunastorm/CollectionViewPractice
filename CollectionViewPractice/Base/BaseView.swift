//
//  BaseView.swift
//  CollectionViewPractice
//
//  Created by 유철원 on 7/18/24.
//

import UIKit

class BaseView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configHierarchy()
        configLayout()
        configView()
        configInteraction()
        configExternalResource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        
    }
    
    func configLayout() {
        
    }
    
    func configView() {
        self.backgroundColor = .white
    }
    
    func configInteraction() {
        
    }
    
    func configExternalResource() {
        
    }
}
