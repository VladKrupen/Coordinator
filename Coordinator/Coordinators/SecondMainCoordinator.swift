//
//  SecondMainCoordinator.swift
//  Coordinator
//
//  Created by Vlad on 28.08.24.
//

import UIKit

class SecondMainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainSecondModule()
    }
    
    private func showMainSecondModule() {
        let second = MainSecondViewController()
        navigationController.pushViewController(second, animated: true)
        second.completionHandler = { [weak self] value in
            self?.showNextViewModule()
        }
    }
    
    private func showNextViewModule() {
        let nextVC = NextViewController()
        navigationController.pushViewController(nextVC, animated: true)
        nextVC.completionHandler = { [weak self] value in
            self?.flowCompletionHandler?()
        }
    }
}
