//
//  BaseViewModel.swift
//  CollectionViewPractice
//
//  Created by 유철원 on 7/18/24.
//

import Foundation

class BaseViewModel {
    
    deinit {
        print("deinit: ", self.self)
    }
    
    init() {
        print(self.self, #function)
        transform()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func transform() {
        
    }
}
