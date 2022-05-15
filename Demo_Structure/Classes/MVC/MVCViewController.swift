//
//  MVCViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation
import UIKit

class MVCViewController: BaseViewController {
    
    private let centerView = MVCView(frame: .init(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 100))
    
    private var model = MVCModel(titleText: "Title", buttonTitle: "Clcik")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fillData()
    }
}

extension MVCViewController {
    
    private func setupViews() {
        centerView.delegate = self
        view.addSubview(centerView)
    }
    
    private func fillData() {
        centerView.fillData(titleText: model.titleText, buttonTitle: model.buttonTitle)
    }
}

extension MVCViewController: ViewDelegate {
    
    func onClickButtonClick() {
        model.titleText = "Title \(arc4random())"
        fillData()
    }
}
