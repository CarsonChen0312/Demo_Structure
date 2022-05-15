//
//  MVVMViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

class MVVMViewController: BaseViewController {
    
    let viewModel: MVVMViewModelProtocol
    
    private let centerView = MVVMView(frame: .init(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 100))
    
    init(viewModel: MVVMViewModelProtocol) {
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

extension MVVMViewController {
    
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
        
        viewModel.onShowAlert { [weak self] model in
            guard let self = self else { return }
            self.showAlertController(title: model.title, message: model.message)
        }
    }
}

extension MVVMViewController: ViewDelegate {
    
    func onClicButtonClick() {
        viewModel.onClicButtonClick()
    }
}
