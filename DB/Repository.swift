//
//  Repository.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 12.03.2021.
//

import Foundation
import Realm

class Repository: Object {
    @objc dynamic var id: Int64 = 0
    @objc dynamic var name: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var isFavourite: Bool = false
    
    convenience init(with id: String, repoName: String, of userName: String, isFavourite: Bool) {
        self.init()
        self.id = id
        self.name = repoName
        self.username = userName
        self.isFavourite = isFavourite
    }
}
