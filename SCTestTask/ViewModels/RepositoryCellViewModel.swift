//
//  RepositoryCellViewModel.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol RepositoryCellViewModelProtocol {
    var name: String { get }
    var description: String? { get }
    
    var forks: String? { get }
    var license: String? { get }
    var updated: String { get }
    var language: String? { get }
    
    var commits: [CommitEntity] { get }
    var commitsDelegate: RepositoryCommitsProtocol? { get set }
}

class RepositoryCellViewModel: RepositoryCellViewModelProtocol {
    var commits: [CommitEntity]  = []
    var commitsDelegate: RepositoryCommitsProtocol?
    
    var language: String? {
        get {
            return repository.language
        }
    }
    
    var forks: String? {
        get {
            if repository.forksCount > 0 {
                return String(repository.forksCount)
            }
            
            return nil
        }
    }
    
    var license: String? {
        get {
            return repository.license?.key
        }
    }
    
    var updated: String {
        get {
            return "Updated on \(DateFormatter.repoCellFormatter.string(from: repository.updated))"
        }
    }
    
    var name: String {
        get {
            return repository.name
        }
    }
    
    var description: String? {
        get {
            return repository.description
        }
    }
    
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
        
        let request = CommitsRequest(repository)
        NetworkClient().perform(request) { (response: ResponseResult<[CommitEntity], NetworkError>) in
            DispatchQueue.main.async {
                if let responseCommits = response.value {
                    self.commits = responseCommits
                    self.commitsDelegate?.commitsDidLoad()
                }

                if let error = response.error {
                    print("[\(repository.name)] Error: \(error.errorDescription ?? "unknown error")")
                }
            }
        }
    }
}
