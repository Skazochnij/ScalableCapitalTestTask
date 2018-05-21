//
//  Api.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

struct Api {
    static let repositories = "https://api.github.com/users/mralexgray/repos?sort=created"
    static let commits = "https://api.github.com/repos/mralexgray/{repo}/commits"
}
