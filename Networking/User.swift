//
//  User.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

struct User: Decodable {
    let login: String
    let id: Int64
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url: String
    let htmlUrl: String
    let followersUrl: String
    let followingUrl: String
    let gistsUrl: String
    let starredUrl: String
    let subscriptionsUrl: String
    let organizationsUrl: String
    let reposUrl: String
    let eventsUrl: String
    let receivedEventsUrl: String
    let type: String
    let siteAdmin: Bool
    
    enum UserCodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        
        login = try container.decode(String.self, forKey: .login)
        id = try container.decode(Int64.self, forKey: .id)
        nodeId = try container.decode(String.self, forKey: .nodeId)
        avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        gravatarId = try container.decode(String.self, forKey: .gravatarId)
        url = try container.decode(String.self, forKey: .url)
        htmlUrl = try container.decode(String.self, forKey: .htmlUrl)
        followersUrl = try container.decode(String.self, forKey: .followersUrl)
        followingUrl = try container.decode(String.self, forKey: .followingUrl)
        gistsUrl = try container.decode(String.self, forKey: .gistsUrl)
        starredUrl = try container.decode(String.self, forKey: .starredUrl)
        subscriptionsUrl = try container.decode(String.self, forKey: .subscriptionsUrl)
        organizationsUrl = try container.decode(String.self, forKey: .organizationsUrl)
        reposUrl = try container.decode(String.self, forKey: .reposUrl)
        eventsUrl = try container.decode(String.self, forKey: .eventsUrl)
        receivedEventsUrl = try container.decode(String.self, forKey: .receivedEventsUrl)
        type = try container.decode(String.self, forKey: .type)
        siteAdmin = try container.decode(Bool.self, forKey: .siteAdmin)
    }
}
