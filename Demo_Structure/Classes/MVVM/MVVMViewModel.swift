//
//  MVVMViewModel.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation

final class MVVMViewModel {
    
    private var model: MVVMModel = MVVMModel(titleText: "Title", buttonTitle: "Click")
    
    private var complation: ((Result<Bool, Error>) -> Void)?
    
    private var onShowAlert: (((title: String, message: String)) -> Void)?
    
    private var num = 0
    
    
}

extension MVVMViewModel: MVVMViewModelProtocol {
    
    var title: String {
        "Special \(model.titleText)"
    }
    
    var buttonTitle: String {
        model.buttonTitle
    }
    
    func loadData(complation: @escaping (Result<Bool, Error>) -> Void) {
        self.complation = complation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            complation(.success(true))
        }
    }
    
    func onClicButtonClick() {
        num += 1
        model.titleText = "Title \(arc4random())"
        complation?(.success(true))
        guard num == 5 else { return }
        onShowAlert?((title: "Kindly Remind", message: "Aready Click \(num) times"))
    }
    
    func onShowAlert(complation: (((title: String, message: String)) -> Void)?) {
        self.onShowAlert = complation
    }
}
