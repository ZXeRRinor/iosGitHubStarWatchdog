//
//  ViewController.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 04.03.2021.
//

import UIKit
import Moya
import Promises

class ViewController: UIViewController {
    var stargazers: [Stargazer] = []
    var stargazersNeeded: Int = 0
    var stargazersLoaded: Int = 0 {
        didSet {
            print(stargazersNeeded != 0 && stargazersNeeded <= stargazersLoaded)
            print(stargazersNeeded)
            print(stargazersLoaded)
            if(stargazersNeeded != 0 && stargazersNeeded <= stargazersLoaded) {
                stargazersNeeded = 0
                stargazersLoaded = 0
                goToChart()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var repoNameField: UITextField!
    
    @IBAction func onLoadButtonClick(_ sender: UIButton) {
        let service = GitHubApiService()
        if let repoName = repoNameField.text, let userName = userNameField.text {
            let repo = service.getRepository(withName: repoName, by: userName)
            repo.then { r in
                self.stargazersNeeded = r.stargazersCount
                let iterations = Int(ceil(Double(r.stargazersCount) / 100))
                for i in 0..<iterations {
                    service.getStargazers(for: repoName, by: userName, fromPage: i).then { stargazers in
                        self.stargazers.append(contentsOf: stargazers)
                        self.stargazersLoaded += stargazers.count
                    }
                }
            }
        } else {
            print("incorrect username or reponame")
        }
    }
    
    func goToChart() {
        let cvc = ChartViewController.build(with: stargazers)
        show(cvc, sender: nil)
    }
}

