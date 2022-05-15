//
//  MVPViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation
import UIKit

class MVPViewController: BaseViewController {
    
    private let present: MVPPresent = MVPPresent()
    
    private let centerView = MVPView(frame: .init(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func showModalViewController() {
        showAlertController(title: "Kindly Remind", message: "Click 5 times")
    }
}

extension MVPViewController {
    
    private func setupViews() {
        view.addSubview(centerView)
        present.view = centerView
        present.viewController = self
        present.setupPage()
    }
}
