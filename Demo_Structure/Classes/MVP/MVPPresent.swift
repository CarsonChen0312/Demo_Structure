//
//  MVPPresent.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation
import UIKit

final class MVPPresent {
    
    weak var viewController: MVPViewController?
    
    var model: MVPModel?
    
    var view: MVPView?
    
    private var sum = 0
    
    func setupPage() {
        model = MVPModel(titleText: "Title", buttonTitle: "Click")
        view?.delegate = self
        fillData()
    }
}

extension MVPPresent {
    
    private func fillData() {
        view?.fillData(titleText: model?.titleText ?? "", buttonTitle: model?.buttonTitle ?? "")
    }
}

extension MVPPresent: ViewDelegate {
    
    func onClicButtonClick() {
        sum += 1
        model?.titleText = "Title \(arc4random())"
        fillData()
        guard sum == 5 else { return }
        viewController?.showModalViewController()
    }
}
