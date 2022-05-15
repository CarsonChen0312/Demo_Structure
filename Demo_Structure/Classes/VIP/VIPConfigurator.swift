//
//  VIPConfigurator.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

final class VIPConfigurator {
    
    func configViewController() -> UIViewController {
        let model = VIPModel(titleText: "VIPTitle", buttonTitle: "Click")
        let viewModel = VIPViewModel(model: model)
        let viewController = VIPViewController(viewModel: viewModel)
        let router = VIPRouter()
        let presenter = VIPPresenter()
        let interactor = VIPInterator()
        viewController.router = router
        viewController.interator = interactor
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.presenter = presenter
        return viewController
    }
}
