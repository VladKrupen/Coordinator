//
//  ConfirmPhoneViewController.swift
//  Coordinator
//
//  Created by Vlad on 3.08.24.
//

import UIKit

final class ConfirmPhoneViewController: UIViewController, FlowController {
    
    var completionHandler: ((Bool) -> Void)?
    
//    private var userData: UserData!
    
    //MARK: - UI
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите код подтверждения"
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
        title = "Подтверждение"
        layoutElements()
    }
    
//    //MARK: - Setup controller
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
extension ConfirmPhoneViewController {
    @objc private func nextButtonTapped() {
        
        //Проверка кода...
        
        
        completionHandler?(true)
        
//        let enterPasswordViewController = EnterPasswordViewController()
//        enterPasswordViewController.setup(userData: userData)
//        navigationController?.pushViewController(enterPasswordViewController, animated: true)
    }
}
