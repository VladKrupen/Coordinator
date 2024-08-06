//
//  Coordinator.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: (() -> Void)? { get set  }
    
    func start()
}
