//
//  NextViewController.swift
//  Coordinator
//
//  Created by Vlad on 28.08.24.
//

import UIKit

class NextViewController: UIViewController, FlowController {
    
    var completionHandler: ((Bool) -> Void)?
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        layoutNextButton()
    }
    
    private func layoutNextButton() {
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func nextButtonTapped() {
        completionHandler?(true)
    }
}
