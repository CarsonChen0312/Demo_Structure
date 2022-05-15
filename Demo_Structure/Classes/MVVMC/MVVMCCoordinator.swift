//
//  MVVMCCoordinator.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation
import UIKit

final class MVVMCCoordinator {
    
    weak var navigationController: UINavigationController?
    
    func pushToMVCPage() {
        let viewController = MVCViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
