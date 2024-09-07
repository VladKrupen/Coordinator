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
    
    func createMainCoordinator(navigationController: UINavigationController) -> MainCoordinator {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        return mainCoordinator
    }
    
    func createFirstMainCoordinator(navigationController: UINavigationController) -> FirstMainCoordinator {
        let firstMainCoordinator = FirstMainCoordinator(navigationController: navigationController)
        return firstMainCoordinator
    }
    
    func createSecondMainCoordinator(navigationController: UINavigationController) -> SecondMainCoordinator {
        let secondMainCoordinator = SecondMainCoordinator(navigationController: navigationController)
        return secondMainCoordinator
    }
}
