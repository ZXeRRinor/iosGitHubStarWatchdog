//
//  Stargazer.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 12.03.2021.
//

import Foundation
import Realm

class Stargazer: Object {
    @objc dynamic var id: Int64 = 0
    @objc dynamic var login: String = ""
    @objc dynamic var starredAt: Date = Date()
    
    convenience init(with login: String, and id: Int64, starredAt: Date) {
        self.init()
        self.id = id
        self.login = login
        self.starredAt = starredAt
    }
}
