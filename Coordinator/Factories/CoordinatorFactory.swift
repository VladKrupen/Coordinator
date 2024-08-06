//
//  CoordinatorFactory.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import Foundation
import UIKit

class CoordinatorFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        return appCoordinator
    }
    
    func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
        let registrationCoordinator = RegistrationCoordinator(navigationController: navigationController)
        return registrationCoordinator
    }
}
