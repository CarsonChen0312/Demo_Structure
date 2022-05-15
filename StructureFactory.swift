//
//  StructureFactory.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation
import UIKit

public struct StructureFactory {
    
    public static func configMVCViewController() -> UIViewController {
        MVCViewController()
    }
    
    public static func configMVPViewController() -> UIViewController {
        MVPViewController()
    }
    
    public static func configMVVMViewController() -> UIViewController {
        let viewModel = MVVMViewModel()
        let viewController = MVVMViewController(viewModel: viewModel)
        return viewController
    }
    
    public static func configMVVMCViewController(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = MVVMCCoordinator()
        coordinator.navigationController = navigationController
        let viewModel = MVVMCViewModel(coordinator: coordinator)
        let viewController = MVVMCViewController(viewModel: viewModel)
        return viewController
    }
    
    public static func configVIPViewController() -> UIViewController {
//        VIPViewConfigurator.configViewController()
        UIViewController()
    }
    
    public static func configVIPERViewController() -> UIViewController {
        UIViewController()
    }
}
