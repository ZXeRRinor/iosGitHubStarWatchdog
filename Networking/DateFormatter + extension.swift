//
//  DateFormatter + extension.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

public extension DateFormatter {
    
    convenience init(format: String) {
        self.init()
        isLenient = true
        dateFormat = format
    }

    static let `default`: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

}
