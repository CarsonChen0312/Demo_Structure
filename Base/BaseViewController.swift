//
//  BaseViewController.swift
//  Demo_Structure
//
//  Created by Carson on 2022/4/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPage()
    }
    
    private func setupPage() {
        var title = NSStringFromClass(self.classForCoder)
        title.removeFirst("Demo_Structure.".count)
        title.removeLast("ViewController".count)
        navigationItem.title = title
        view.backgroundColor = .white
    }
    
    func showAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
