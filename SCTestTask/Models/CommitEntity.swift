//
//  CommitEntity.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct CommitEntity: Codable {
    let sha: String
    let commit: Commit
}
