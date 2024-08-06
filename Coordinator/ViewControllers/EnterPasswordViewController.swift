//
//  EnterPasswordViewController.swift
//  Coordinator
//
//  Created by Vlad on 3.08.24.
//

import UIKit

final class EnterPasswordViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> Void)?
    
//    private var userData: UserData!
    
    //MARK: - UI
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Пароль"
        layoutElements()
    }
    
    //MARK: Setup controller
//    func setup(userData: UserData) {
//        self.userData = userData
//    }
    
    //MARK: - Layout
    private func layoutElements() {
        layoutVerticalStack()
    }
    
    private func layoutVerticalStack() {
        verticalStack.addArrangedSubview(textField)
        verticalStack.addArrangedSubview(nextButton)
        view.addSubview(verticalStack)
        
        NSLayoutConstraint.activate([
            verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - OBJC
extension EnterPasswordViewController {
    @objc private func nextButtonTapped() {
        
        completionHandler?(textField.text)
        
//        userData.password = textField.text
//        let enterNameViewController = EnterNameViewController()
//        enterNameViewController.setup(userData: userData)
//        navigationController?.pushViewController(enterNameViewController, animated: true)
    }
}
