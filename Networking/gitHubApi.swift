//
//  gitHubApi.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation
import Moya

enum GitHubApi {
    case getStargazers(user: String, repo: String, page: Int, perPage: Int)
    case getRepositoryInfo(user: String, repo: String)
    case getRepositoriesOfUser(user: String, page: String, perPage: String)
    case getUser(name: String)
}

extension GitHubApi : TargetType {
    var baseURL: URL {
        URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .getStargazers(let user, let repo, _, _):
                return "/repos/\(user)/\(repo)/stargazers"
            case .getRepositoryInfo(let user, let repo):
                return "/repos/\(user)/\(repo)"
        case .getRepositoriesOfUser(let user, _, _):
                return "/users/\(user)/repos"
            case .getUser(let name):
                return "/users/\(name)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .getStargazers(_, _, let page, let perPage):
            return .requestParameters(parameters: [ "page": page, "per_page": perPage], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/vnd.github.v3.star+json"]
    }
    
    
}
