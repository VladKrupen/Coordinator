//
//  FirstMainCoordinator.swift
//  Coordinator
//
//  Created by Vlad on 28.08.24.
//

import UIKit

class FirstMainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var flowCompletionHandler: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainFirstModule()
    }
    
    private func showMainFirstModule() {
        let first = MainFirstViewController()
        navigationController.pushViewController(first, animated: true)
        first.completionHandler = { [weak self] value in
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
