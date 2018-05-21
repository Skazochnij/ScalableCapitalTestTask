//
//  RepositoryViewModel.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol RepositoryViewModelProtocol {
    var controller: RepositoryViewControllerProtocol? { get set }
    var repositories: [Repository] { get }
}

class RepositoryViewModel: RepositoryViewModelProtocol {
    private let repository: RepositoriesRepository
    
    var controller: RepositoryViewControllerProtocol?
    var repositories: [Repository] = []
    
    init(with repository: RepositoriesRepository) {
        self.repository = repository
        
        repository.get { (repositories) in
            self.repositories = repositories
            self.repositoriesDidLoad()
            self.performNetworkRequest()
        }
    }
    
    private func performNetworkRequest() {
        let request = RepositoriesRequest()
        NetworkClient().perform(request) { (result: ResponseResult<[Repository], NetworkError>) in
            if let repositories = result.value {
                self.repositories = repositories
                self.repositoriesDidLoad()
                
                self.repository.upsert(entity: repositories)
            }
        }
    }
    
    private func repositoriesDidLoad() {
        DispatchQueue.main.async {
            self.controller?.repositoriesDidLoad()
        }
    }
}
