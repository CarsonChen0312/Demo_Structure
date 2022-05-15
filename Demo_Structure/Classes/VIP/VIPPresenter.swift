//
//  VIPPresenter.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

final class VIPPresenter {
    
    weak var viewController: VIPViewControllerProtocol?
    
}

extension VIPPresenter: VIPPresenterProtocol {
    
    func onLoadDataSuccess(flag: Bool) {
        viewController?.showLogingSuccess(fullUserName: flag ? "This is success message" : "Logic error")
    }
    
    func onLoadDataFailure(error: Error) {
        viewController?.showLogingFailure(message: "This is error message \(error.localizedDescription)")
    }
    
    func onClickButtonClick() {
        let num = arc4random()
        viewController?.updateContent(content: "Change \(num)")
    }
}
