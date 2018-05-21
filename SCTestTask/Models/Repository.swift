//
//  Repository.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let forksCount: Int = 0
    let license: License?
    let created: Date
    let updated: Date
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case forksCount = "forks_count"
        case created = "created_at"
        case updated = "updated_at"
        case id
        case name
        case description
        case license
        case language
    }
}
