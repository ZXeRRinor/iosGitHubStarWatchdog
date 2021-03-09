//
//  StargazerResults.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

struct StargazerResults: Decodable {
    let page: Int
    let resultsOnPage: Int
    let stargazers: [Stargazer]
}
