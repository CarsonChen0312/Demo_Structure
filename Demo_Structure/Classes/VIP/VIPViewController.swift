//
//  VIPViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

final class VIPViewController: BaseViewController {
    
    var interator: VIPInteratorProtocol?
    
    var router: VIPRouterProtocol?
    
    private var viewModel: VIPViewModel
    
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
        bindData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        interator?.onPageTap()
    }
}

extension VIPViewController {
    
    private func setupViews() {
        view.addSubview(centerView)
        centerView.delegate = self
    }
    
    private func bindData() {
        centerView.fillData(titleText: viewModel.titleText, buttonTitle: viewModel.buttonTitle)
    }
}

extension VIPViewController: VIPViewControllerProtocol {
    
    func showLogingSuccess(fullUserName: String) {
        router?.showLogingSuccess(fullUserName: fullUserName)
    }
    
    func showLogingFailure(message: String) {
        router?.showLogingFailure(message: message)
    }
    
    func updateContent(content: String) {
        centerView.fillData(titleText: content, buttonTitle: viewModel.buttonTitle)
    }
}


extension VIPViewController: ViewDelegate {
    
    func onClickButtonClick() {
        interator?.onClickButtonClick()
    }
}
