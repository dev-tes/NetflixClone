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
        tabBar.tintColor = .label
        configureTabs()
    }
    
    func configureTabs(){
        
        let viewController1 = UINavigationController(rootViewController: HomeViewController())
        let viewController2 = UINavigationController(rootViewController: UpcomingViewController())
        let viewController3 = UINavigationController(rootViewController: SearchViewController())
        let viewController4 = UINavigationController(rootViewController: DownloadsViewController())
        
        let parentArrayOfVC: [UIViewController] = [viewController1, viewController2, viewController3, viewController4]
        
        viewController1.tabBarItem.image = UIImage(systemName: "house")
        viewController2.tabBarItem.image = UIImage(systemName: "play.circle")
        viewController3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        viewController4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        viewController1.title = "Home"
        viewController2.title = "Coming Soon"
        viewController3.title = "Top Searches"
        viewController4.title = "Downloads"
        
        setViewControllers(parentArrayOfVC, animated: true)
    }
}
