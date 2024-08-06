//
//  RegistrationCoordinator.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import Foundation
import UIKit

class RegistrationCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: (() -> Void)?
    
    private let moduleFactory: ModuleFactory = ModuleFactory()
    private var userData: UserData = UserData(phoneNumber: nil, password: nil, name: nil, birthday: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showEnterPhoneModule()
    }
    
    private func showEnterPhoneModule() {
        let controller = moduleFactory.createEnterPhoneModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.phoneNumber = value
            self?.showConfirmPhoneModule()
        }
        navigationController.pushViewController(controller, animated: true )
    }
    
    private func showConfirmPhoneModule() {
        let controller = moduleFactory.createConfirmPhoneModule()
        controller.completionHandler = { [weak self] value in
            guard value else {
                //show error
                return
            }
            self?.showEnterPasswordModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterPasswordModule() {
        let controller = moduleFactory.createEnterPasswordModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.password = value
            self?.showEnterNameModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterNameModule() {
        let controller = moduleFactory.createEnterNameModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.name = value
            self?.showEnterBirthdayModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterBirthdayModule() {
        let controller = moduleFactory.createEnterBirthdayModule()
        controller.completionHandler = { [weak self] value in
            self?.userData.birthday = value 
            //go to main
            self?.flowCompletionHandler?()
        }
        navigationController.pushViewController(controller, animated: true)
    }
}
