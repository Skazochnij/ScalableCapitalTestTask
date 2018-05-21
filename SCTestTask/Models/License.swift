//
//  License.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct License: Codable {
    let key: String
    let name: String
    let spdxId: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case spdxId = "spdx_id"
        case key
        case name
        case url
    }
}
