//
//  Stargazer.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

struct Stargazer {
    let starredAt: String
    let user: User
    enum StargazerCodingKeys: String, CodingKey {
        case starredAt = "starred_at"
        case user
    }
}
