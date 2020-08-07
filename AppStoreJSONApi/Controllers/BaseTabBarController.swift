//
//  BaseTabBarController.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 14.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let greenViewController = UIViewController()
        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", image: "apps"),
            createNavController(viewController: SearchPageController(), title: "Search", image: "search" ),
            createNavController(viewController: greenViewController, title: "Today", image: "today_icon")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        navController.navigationBar.prefersLargeTitles = true
        return navController
        
    }
}
