//
//  VIPRouter.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

protocol VIPRoutingLogic {
    
    func showLogingSuccess(fullUserName: String)
    func showLogingFailure(message: String)
} 

final class VIPRouter {
    
    weak var source: UIViewController?
    
    private func showAlert(message: String) {
        let alert = UIAlertController.alert(message)
        source?.present(alert, animated: true, completion: nil)
    }
}

extension VIPRouter: VIPRoutingLogic {
    
    func showLogingSuccess(fullUserName: String) {
        showAlert(message: fullUserName)
    }
    
    func showLogingFailure(message: String) {
        showAlert(message: message)
    }
}

extension UIAlertController {
    
    static func alert(_ message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Kindly Remind", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        return alert
    }
}
