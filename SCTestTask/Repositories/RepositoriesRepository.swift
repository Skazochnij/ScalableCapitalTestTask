//
//  RepositoriesRepository.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

protocol Storable where T: ManagedObjectConvertible {
    associatedtype T

    var worker: CoreDataWorker<T.ManagedObject, T> { get }

    func upsert(entity: [T])
    func get(completion: @escaping([T]) -> Void)
}

class RepositoriesRepository: Storable {
    typealias T = Repository

    var worker: CoreDataWorker<RepositoryManagedObject, Repository>

    init(with worker: CoreDataWorker<RepositoryManagedObject, Repository>) {
        self.worker = worker
    }

    func upsert(entity: [Repository]) {
        worker.upsert(entities: entity) { (error) in
            if let error = error {
                print("Repositories didn't saved. Error: \(error)")
            } else {
                print("Repositories saved successfully")
            }
        }
    }

    func get(completion: @escaping ([Repository]) -> Void) {
        let sort = NSSortDescriptor(key: "createdDate", ascending: false)
        worker.get(sortDescriptors: [sort], completion: { (repos: [Repository]) in
            completion(repos)
        })
    }
}
