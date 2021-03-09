//
//  ServerError.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

struct ServerError: Decodable, Error {
    let message: String
}
