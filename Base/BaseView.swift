//
//  BaseView.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation
import UIKit

protocol ViewDelegate: AnyObject {
    
    func onClickButtonClick()
}

class BaseView: UIView {
    
    private let label = UILabel()
    
    private let button = UIButton(type: .system)
    
    weak var delegate: ViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseView {
    
    func fillData(titleText: String, buttonTitle: String) {
        label.text = titleText
        button.setTitle(buttonTitle, for: .normal)
    }
}

extension BaseView {
    
    private func setupViews() {
        label.textAlignment = .center
        label.frame = .init(x: 0, y: 0, width: bounds.width / 2.0, height: bounds.height)
        button.frame = .init(x: bounds.width / 2.0, y: 0, width: bounds.width / 2.0, height: bounds.height)
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(onClickButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func onClickButtonAction() {
        delegate?.onClickButtonClick()
    }
}
