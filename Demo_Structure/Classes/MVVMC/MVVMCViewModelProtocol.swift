//
//  MVVMCViewModelProtocol.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

protocol MVVMCViewModelProtocol {
    
    var title: String { get }
    
    var buttonTitle: String { get }
    
    func loadData(complation: @escaping (Result<Bool, Error>) -> Void)
    
    func onClickButtonClick()
}
