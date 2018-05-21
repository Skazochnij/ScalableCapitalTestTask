//
//  RepositoriesRequest.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct RepositoriesRequest: Request {
    typealias ResponseObject = [Repository]
    
    func build() -> URLRequest {
        let url = URL(string: Api.repositories)
        return URLRequest(url: url!)
    }
    
    func parse(jsonData: Data) -> [Repository] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        
        if let repositories = try? decoder.decode([Repository].self, from: jsonData) {
            return repositories
        } else {
            return []
        }
    }
}
