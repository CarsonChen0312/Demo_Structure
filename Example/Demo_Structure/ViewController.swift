//
//  ViewController.swift
//  Demo_Structure
//
//  Created by Carson on 04/21/2022.
//  Copyright (c) 2022 Carson. All rights reserved.
//

import UIKit
import Demo_Structure

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.separatorStyle = .none
        return tableView
    }()
         
    private lazy var dataSouce: [DataSource] = {
        [
           DataSource(title: "MVC", onClick: {
               self.stepToNextPage(viewController: StructureFactory.configMVCViewController())
           }),
           DataSource(title: "MVP", onClick: {
               self.stepToNextPage(viewController: StructureFactory.configMVPViewController())
           }),
           DataSource(title: "MVVM", onClick: {
               self.stepToNextPage(viewController: StructureFactory.configMVVMViewController())
           }),
           DataSource(title: "MVVMC", onClick: {
               self.stepToNextPage(viewController: StructureFactory.configMVVMCViewController(navigationController: self.navigationController))
           }),
           DataSource(title: "VIP", onClick: {
               self.stepToNextPage(viewController: StructureFactory.configVIPViewController())
           }),
           DataSource(title: "VIPER", onClick: {
               self.stepToNextPage(viewController: StructureFactory.configVIPERViewController())
           })
       ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Structure"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func stepToNextPage(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSouce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = dataSouce[indexPath.row].title
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dataSouce[indexPath.row].onClick?()
    }
}


struct DataSource {
    
    var title: String
    
    var onClick: (() -> Void)?
}
