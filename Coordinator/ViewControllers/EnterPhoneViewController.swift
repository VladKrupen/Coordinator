//
//  EnterPhoneViewController.swift
//  Coordinator
//
//  Created by Vlad on 3.08.24.
//

import UIKit

final class EnterPhoneViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> Void)?
    
    //MARK: - UI
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите номер телефона"
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
        title = "Номер"
        layoutElements()
    }
    
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
extension EnterPhoneViewController {
    @objc private func nextButtonTapped() {
        
        completionHandler?(textField.text)
        
//        let userData = UserData(phoneNumber: textField.text, password: nil, name: nil, birthday: nil)
//        let confirmPhoneViewController = ConfirmPhoneViewController()
//        confirmPhoneViewController.setup(userData: userData)
//        navigationController?.pushViewController(confirmPhoneViewController, animated: true)
    }
}
