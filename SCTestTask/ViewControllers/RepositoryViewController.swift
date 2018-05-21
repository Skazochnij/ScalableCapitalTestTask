//
//  RepositoryViewController.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

protocol RepositoryViewControllerProtocol {
    func repositoriesDidLoad()
}

class RepositoryViewController: UIViewController, NibLoadable {
    @IBOutlet weak var repositoriesTable: UITableView!
    
    var viewModel: RepositoryViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories" //TODO replace with localization
        
        repositoriesTable.rowHeight = 175 //TODO Replace with automatic height
        repositoriesTable.estimatedRowHeight = 175
        repositoriesTable.register(RepositoryTableViewCell.self)
        
        bindViewModel()
    }
}

extension RepositoryViewController: RepositoryViewControllerProtocol {
    fileprivate func bindViewModel() {
        viewModel?.controller = self
    }
    
    func repositoriesDidLoad() {
        repositoriesTable.reloadData()
    }
}

extension RepositoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.repositories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = repositoriesTable.dequeueReusableCell(forIndexPath: indexPath)
        
        if let repository = viewModel?.repositories[indexPath.row] {
            let viewModel = RepositoryCellViewModel(repository)
            cell.viewModel = viewModel
        }
        
        return cell
    }
}
