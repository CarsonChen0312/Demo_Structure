//
//  MVVMCViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

class MVVMCViewController: BaseViewController {
    
    let viewModel: MVVMCViewModelProtocol
    
    private let centerView = MVVMCView(frame: .init(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 100))
    
    init(viewModel: MVVMCViewModelProtocol) {
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
}

extension MVVMCViewController {
    
    private func setupViews() {
        view.addSubview(centerView)
        centerView.delegate = self
    }
    
    private func bindData() {
        viewModel.loadData { [weak self] reuslt in
            guard let self = self else { return }
            switch reuslt {
            case .success(let flag):
                guard flag else { return }
                self.centerView.fillData(titleText: self.viewModel.title, buttonTitle: self.viewModel.buttonTitle)
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension MVVMCViewController: ViewDelegate {
    
    func onClicButtonClick() {
        viewModel.onClicButtonClick()
    }
}
