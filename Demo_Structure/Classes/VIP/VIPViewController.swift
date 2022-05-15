//
//  VIPViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

protocol VIPViewControllerInput {
    
    func showLogingSuccess(fullUserName: String)
    func showLogingFailure(message: String)
}

protocol VIPViewControllerOutput {
    func tryToLogIn()
}

final class VIPViewController: BaseViewController {
    
    var interator: VIPInteratorInput?
    
    var router: VIPRoutingLogic?
    
    private let viewModel: VIPViewModel
    
    private let centerView = VIPView(frame: .init(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 100))
    
    init(viewModel: VIPViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension VIPViewController {
    
    private func setupViews() {
        view.addSubview(centerView)
    }
}

extension VIPViewController: VIPViewControllerInput {
    
    func showLogingSuccess(fullUserName: String) {
        router?.showLogingSuccess(fullUserName: fullUserName)
    }
    
    func showLogingFailure(message: String) {
        router?.showLogingFailure(message: message)
    }
}

extension VIPViewController: VIPViewControllerOutput {
    
    func tryToLogIn() {
        
    }
}
