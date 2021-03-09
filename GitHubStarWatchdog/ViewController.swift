//
//  ViewController.swift
//  GitHubStarWatchdog
//
//  Created by Anton Potapov on 04.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var repoNameField: UITextField!
    
    @IBAction func onLoadButtonClick(_ sender: UIButton) {
        print(userNameField?.text ?? "")
        print(repoNameField?.text ?? "")
    }
}
