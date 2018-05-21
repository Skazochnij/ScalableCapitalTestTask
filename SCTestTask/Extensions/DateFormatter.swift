//
//  DateFormatter.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    static let repoCellFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, dd YYYY"
        return dateFormatter
    }()
}
