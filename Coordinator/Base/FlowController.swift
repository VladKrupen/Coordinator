//
//  FlowController.swift
//  Coordinator
//
//  Created by Vlad on 4.08.24.
//

import Foundation

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T) -> Void)? { get set }
}
 
