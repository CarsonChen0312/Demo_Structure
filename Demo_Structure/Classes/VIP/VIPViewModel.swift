//
//  VIPViewModel.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

struct VIPViewModel {
    
    private let model: VIPModel
    
    lazy var titleText: String  = { model.titleText }()
    
    lazy var buttonTitle: String  = { model.buttonTitle }()
    
    init(model: VIPModel) {
        self.model = model
    }
    
}
