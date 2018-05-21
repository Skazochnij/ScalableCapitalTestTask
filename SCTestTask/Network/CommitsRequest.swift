//
//  CommitsRequest.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct CommitsRequest: Request {
    typealias ResponseObject = [CommitEntity]
    
    private let repository: Repository
    
    init(_ repository: Repository) {
        self.repository = repository
    }
    
    func build() -> URLRequest {
        let url = URL(string: Api.commits.replacingOccurrences(of: "{repo}", with: repository.name))
        return URLRequest(url: url!)
    }
    
    func parse(jsonData: Data) -> [CommitEntity] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        if let commits = try? decoder.decode([CommitEntity].self, from: jsonData) {
            return commits
        } else {
            return []
        }
    }
}
