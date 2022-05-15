//
//  VIPProtocols.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

protocol VIPViewControllerProtocol: AnyObject {
    func showLogingSuccess(fullUserName: String)
    func showLogingFailure(message: String)
    func updateContent(content: String)
}

protocol VIPPresenterProtocol {
    func onLoadDataSuccess(flag: Bool)
    func onLoadDataFailure(error: Error)
    func onClickButtonClick()
}

protocol VIPRouterProtocol {
    func showLogingSuccess(fullUserName: String)
    func showLogingFailure(message: String)
}

protocol VIPInteratorProtocol {
    func onClickButtonClick()
    func onPageTap()
}
