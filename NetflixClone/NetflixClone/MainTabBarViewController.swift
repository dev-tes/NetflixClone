//
//  ViewController.swift
//  NetflixClone
//
//  Created by Tes on 06/03/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let viewController1 = UINavigationController(rootViewController: HomeViewController())
    let viewController2 = UINavigationController(rootViewController: UpcomingViewController())
    let viewController3 = UINavigationController(rootViewController: SearchViewController())
    let viewController4 = UINavigationController(rootViewController: DownloadsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setViewControllers([viewController1,viewController2,viewController3,viewController4], animated: true)
    }
}
