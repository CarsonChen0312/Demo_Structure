//
//  BaseModel.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

class BaseModel {
    
    var titleText: String
    
    var buttonTitle: String
    
    init(
        titleText: String,
        buttonTitle: String
    ) {
        self.titleText = titleText
        self.buttonTitle = buttonTitle
    }
}
