//
//  VIPConfigurator.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

struct VIPConfigurator {
    
    static func configViewController() -> UIViewController {
        let viewModel = VIPViewModel()
        let viewController = VIPViewController(viewModel: viewModel)
        let router = VIPRouter()
        viewController.router = router
        return viewController
    }
}
