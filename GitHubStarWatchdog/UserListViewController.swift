//
//  UserListViewController.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 11.03.2021.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var users: [User] = []
    
    @IBOutlet weak var userListTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.userListTable!.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = self.users[indexPath.row].login
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTable?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        userListTable?.delegate = self
        userListTable?.dataSource = self
    }
}

extension UserListViewController {
    static func build(with users: [User]) -> UserListViewController {
        let sb = UIStoryboard(name: "UserList", bundle: nil)
        let controller = sb.instantiateViewController(identifier: "UserListViewController") as! UserListViewController
        controller.users = users
        return controller
    }
}
