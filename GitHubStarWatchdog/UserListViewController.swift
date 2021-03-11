//
//  UserListViewController.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 11.03.2021.
//

import UIKit

class UserListViewController: UIViewController {
    var users: [User] = []
    
}

extension UserListViewController {
    static func build(for users: [User]) -> UserListViewController {
        let sb = UIStoryboard(name: "UserList", bundle: nil)
        let controller = sb.instantiateViewController(identifier: "UserListViewController") as! UserListViewController
        controller.users = users
        return controller
    }
}
