//
//  MVVMViewModelProtocol.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

protocol MVVMViewModelProtocol {
    
    var title: String { get }
    
    var buttonTitle: String { get }
    
    func loadData(complation: @escaping (Result<Bool, Error>) -> Void)
    
    func onClicButtonClick()
    
    func onShowAlert(complation: (((title: String, message: String)) -> Void)?)
}
