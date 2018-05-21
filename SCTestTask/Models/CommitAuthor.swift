//
//  CommitAuthor.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct CommitAuthor: Codable {
    let name: String
    let email: String
    let date: Date
}
