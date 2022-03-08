//
//  ViewController.swift
//  NetflixClone
//
//  Created by Tes on 06/03/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        let viewController1 = UINavigationController(rootViewController: HomeViewController())
        let viewController2 = UINavigationController(rootViewController: UpcomingViewController())
        let viewController3 = UINavigationController(rootViewController: SearchViewController())
        let viewController4 = UINavigationController(rootViewController: DownloadsViewController())
        
        viewController1.tabBarItem.image = UIImage(systemName: "house")
        viewController2.tabBarItem.image = UIImage(systemName: "play.circle")
        viewController3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        viewController4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        setViewControllers([viewController1,viewController2,viewController3,viewController4], animated: true)
    }
}
