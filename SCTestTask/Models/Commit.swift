//
//  Commit.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct Commit: Codable {
    let author: CommitAuthor
    let committer: CommitAuthor
    let message: String
    let url: URL
    let commentCount: Int
    
    enum CodingKeys: String, CodingKey {
        case commentCount = "comment_count"
        case author
        case committer
        case message
        case url
    }
}
