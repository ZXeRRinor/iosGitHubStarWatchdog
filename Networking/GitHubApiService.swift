//
//  GitHubApiService.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 10.03.2021.
//

import Foundation
import Moya
import Promises

struct GitHubApiService {
    private let provider = MoyaProvider<GitHubApi>()
    
    func getStargazers(for repoName: String, by userName: String, fromPage: Int) -> Promise<[Stargazer]> {
        provider.request(.getStargazers(user: userName, repo: repoName, page: fromPage, perPage: 100))
    }
    
    func getRepository(withName repoName: String, by userName: String) -> Promise<Repository> {
        provider.request(.getRepositoryInfo(user: userName, repo: repoName))
    }
}
