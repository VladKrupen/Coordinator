//
//  ModuleFactory.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import Foundation

class ModuleFactory {
    
    func createEnterPhoneModule() -> EnterPhoneViewController {
        let enterPhoneViewController = EnterPhoneViewController()
        return enterPhoneViewController
    }
    
    func createConfirmPhoneModule() -> ConfirmPhoneViewController {
        let confirmPhoneViewController = ConfirmPhoneViewController()
        return confirmPhoneViewController
    }
    
    func createEnterPasswordModule() -> EnterPasswordViewController {
        let enterPasswordViewController = EnterPasswordViewController()
        return enterPasswordViewController
    }
    
    func createEnterNameModule() -> EnterNameViewController {
        let enterNameViewController = EnterNameViewController()
        return enterNameViewController
    }
    
    func createEnterBirthdayModule() -> EnterBirthdayViewController {
        let enterBirthdayViewController = EnterBirthdayViewController()
        return enterBirthdayViewController
    }
}
 
