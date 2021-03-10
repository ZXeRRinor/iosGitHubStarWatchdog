//
//  License.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 10.03.2021.
//

import Foundation

struct License: Decodable {
    let key: String
    let name: String
    let spdxId: String
    let url: String
    let nodeId: String
}
