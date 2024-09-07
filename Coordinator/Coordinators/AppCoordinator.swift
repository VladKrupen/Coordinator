//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: (() -> Void)?
    
    //ЧТобы хранить ссылки на координаторы
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //Проверка на аутентификацию
        let auth = false
        
        guard auth else {
            showRegistrationFlow()
            return
        }
        //showMainFlow()
        showMainFlow()
        
    }
    
    private func showRegistrationFlow() {
        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)
        
        //Добавляем ссылку на координатор регистрации
        childCoordinators.append(registrationCoordinator)
        registrationCoordinator.start()
        
        //Уведомление о завершении регистрации
        registrationCoordinator.flowCompletionHandler = { [weak self] in
            print("Регистрация успешна, переход на главный экран")
            self?.showMainFlow()
        }
    }
    
    private func showMainFlow() {
        let mainCoordinator = CoordinatorFactory().createMainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
        mainCoordinator.flowCompletionHandler = { [weak self] in
            self?.childCoordinators.removeAll()
            self?.showRegistrationFlow()
        }
    }
}
