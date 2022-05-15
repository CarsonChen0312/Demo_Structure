//
//  MVVMCViewModel.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

final class MVVMCViewModel  {
    
    private let coordinator: MVVMCCoordinator
    
    private var model: MVVMCModel = MVVMCModel(titleText: "Title", buttonTitle: "Step To MVC")
    
    private var num = 0
    
    init(coordinator: MVVMCCoordinator) {
        self.coordinator = coordinator
    }
}

extension MVVMCViewModel: MVVMCViewModelProtocol {
    
    var title: String {
        "Special \(model.titleText)"
    }
    
    var buttonTitle: String {
        model.buttonTitle
    }
    
    func loadData(complation: @escaping (Result<Bool, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            complation(.success(true))
        }
    }
    
    func onClicButtonClick() {
        coordinator.pushToMVCPage()
    }
}
