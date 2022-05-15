//
//  VIPInterator.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/22.
//

import Foundation

final class VIPInterator {
    
    var presenter: VIPPresenterProtocol?
}

extension VIPInterator: VIPInteratorProtocol {
        
    func onClickButtonClick() {
        presenter?.onClickButtonClick()
    }
    
    func onPageTap() {
        loadData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let flag):
                self.presenter?.onLoadDataSuccess(flag: flag)
            case .failure(let error):
                self.presenter?.onLoadDataFailure(error: error)
            }
        }
    }
}

extension VIPInterator {
    
    private func loadData(flag: Bool = true, complation: @escaping (Result<Bool, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            complation(.success(flag))
        }
    }
}
