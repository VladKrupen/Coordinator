//
//  MainTabBarController.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let mainViewController = createNavigationController(viewController: MainViewController(), itemName: "Main", itemImage: "heart", tag: 0)
        viewControllers = [mainViewController]
    }
    
    private func createNavigationController(viewController: UIViewController, itemName: String, itemImage: String, tag: Int) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: tag)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
}
