//
//  Repository.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 09.03.2021.
//

import Foundation

struct Repository: Decodable {
    let id: Int64
    let name: String
    
//    let `private`: Bool
    
    let owner: User
//    let htmlUrl: String
    
//    let description: String?
//    let fork: Bool
//    let url, forksUrl: String
//    let keysUrl, collaboratorsUrl: String
//    let teamsUrl, hooksUrl: String
//    let issueEventsUrl: String
//    let eventsUrl: String
//    let assigneesUrl, branchesUrl: String
//    let tagsUrl: String
//    let blobsUrl, gitTagsUrl, gitRefsUrl, treesUrl: String
//    let statusesUrl: String
//    let languagesUrl, stargazersUrl, contributorsUrl, subscribersUrl: String
//    let subscriptionUrl: String
//    let commitsUrl, gitCommitsUrl, commentsUrl, issueCommentUrl: String
//    let contentsUrl, compareUrl: String
//    let mergesUrl: String
//    let archiveUrl: String
//    let downloadsUrl: String
//    let issuesUrl, pullsUrl, milestonesUrl, notificationsUrl: String
//    let labelsUrl, releasesUrl: String
//    let deploymentsUrl: String
//    let createdAt, updatedAt, pushedAt: Date
//    let gitUrl, sshUrl: String
//    let cloneUrl: String
//    let svnUrl: String
//    let homepage: String?
//    let size: Int
    
    let stargazersCount: Int
    
//    let watchersCount: Int
//    let language: String?
//    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
//    let hasPages: Bool
//    let forksCount: Int
//    let mirrorUrl: String?
//    let archived, disabled: Bool
//    let openIssuesCount: Int
//    let license: License?
//    let forks, openIssues, watchers: Int
//    let defaultBranch: String
//    let tempCloneToken: String?
    
//    let organization: User
    
//    let networkCount, subscribersCount: Int?
}
