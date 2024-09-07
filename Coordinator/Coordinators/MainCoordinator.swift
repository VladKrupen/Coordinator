//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Vlad on 28.08.24.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private var childCoordinators: [Coordinator] = []
    
    func start() {
        setupTabBar()
    }
    
    private func setupTabBar() {
        let tabBarController = UITabBarController()
        let firstNavigationController = UINavigationController()
        let secondNavigationController = UINavigationController()
        showMainFirstFlow(navigationController: firstNavigationController)
        showMainSecondFlow(navigationController: secondNavigationController)
        firstNavigationController.tabBarItem = UITabBarItem(title: "Hi", image: UIImage(systemName: "heart"), tag: 1)
        secondNavigationController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "person"), tag: 1)
        tabBarController.viewControllers = [firstNavigationController, secondNavigationController]
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func showMainFirstFlow(navigationController: UINavigationController) {
        let firstMainCoordinator = CoordinatorFactory().createFirstMainCoordinator(navigationController: navigationController)
        childCoordinators.append(firstMainCoordinator)
        firstMainCoordinator.start()
        firstMainCoordinator.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
            self?.childCoordinators.removeAll()
        }
    }
    
    private func showMainSecondFlow(navigationController: UINavigationController) {
        let secondMainCoordinator = CoordinatorFactory().createSecondMainCoordinator(navigationController: navigationController)
        childCoordinators.append(secondMainCoordinator)
        secondMainCoordinator.start()
        secondMainCoordinator.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
            self?.childCoordinators.removeAll()
        }
    }
}
