//
//  JSONDecoder + default.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

public extension JSONDecoder {
     static var `default`: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.default)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
