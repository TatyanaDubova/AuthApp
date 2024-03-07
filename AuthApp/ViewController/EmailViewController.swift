//
//  EmailViewController.swift
//  AuthApp
//
//  Created by Татьяна Дубова on 07.03.2024.
//

import UIKit

//MARK: - EmailViewController
class EmailViewController: UIViewController {
    
    //MARK: - Private Property
    private let bgView = UIView()
    private let welcomeImage = UIImageView()
    
    private let firstName = LabeledTextField(title: "FirstName", placeholder: "FirstName")
    private let lastName = LabeledTextField(title: "LastName", placeholder: "LastName")
    private let email = LabeledTextField(title: "Email", placeholder: "Enter your email")
    private let password = LabeledTextField(title: "Password", placeholder: "Enter your password", isPrivate: true)
    
    private let imageName = EyeButton()
    private let registerButton = CustomButton(title: "Register", backgroundColor: .systemBlue, isShadow: true, titleColor: .white)
    
    private let quastionLabel = CustomLabel(title: "Already onboard?")
    
    private let eyeButton = EyeButton()
    private let linkButton = UIButton()
    
    private let namesContainer = UIStackView()
    private let logInContainer = UIStackView()
    
    private var isPrivate = true
    
    //MARK: - Override Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK: - Actions
    @objc
    private func displayBookmarks() {
        let imageName = isPrivate ? "eye" : "eye.slash"
        
        password.textField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPrivate.toggle()
    }
}

//MARK: - Settings View
private extension EmailViewController {
    func setupView() {
        settingView()
        
        addSubViews()
        addActions()
        
        appointDelegate()
        
        setupPasswordTF()
        setupBgView()
        setupLogoImage()
        setupLinkButton()
        
        setupTwoNamesContainer()
        setupLogInContainer()
        
        setupLayout()
    }
    
    func settingView() {
        view.backgroundColor = .systemYellow
    }
}

//MARK: - Setting
private extension EmailViewController {
    func addSubViews() {
        [welcomeImage, bgView, namesContainer,
         firstName, lastName,
         email, password, registerButton,
         logInContainer].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func addActions() {
        eyeButton.addTarget(self, action: #selector(displayBookmarks), for: .touchUpInside)
    }
    
    func appointDelegate() {
        firstName.textField.delegate = self
        lastName.textField.delegate = self
        email.textField.delegate = self
        password.textField.delegate = self
    }
    
    func setupPasswordTF() {
        password.textField.rightView = eyeButton
        password.textField.rightViewMode = .always
        password.textField.rightView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupBgView() {
        bgView.backgroundColor = .mainBackground
    }
    
    func setupLogoImage() {
        welcomeImage.image = UIImage(named: "logo")
        welcomeImage.contentMode = .scaleAspectFit
    }
    
    func setupLinkButton() {
        linkButton.setTitle("Log In", for: .normal)
        linkButton.setTitleColor(.systemPink, for: .normal)
        linkButton.setTitleColor(.highlightedColor, for: .highlighted)
        linkButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
    }
    
    func setupTwoNamesContainer() {
        namesContainer.axis = .horizontal
        namesContainer.spacing = 16
        namesContainer.distribution = .fillEqually
        namesContainer.addArrangedSubview(firstName)
        namesContainer.addArrangedSubview(lastName)
    }
    
    func setupContainer(stackView: UIStackView, topLabel: UIView) {
        stackView.axis = .vertical
        stackView.addArrangedSubview(topLabel)
    }
    
    func setupLogInContainer() {
        logInContainer.axis = .horizontal
        
        logInContainer.addArrangedSubview(quastionLabel)
        logInContainer.addArrangedSubview(linkButton)
    }
}

//MARK: - Layout
private extension EmailViewController {
    func setupLayout() {
        [bgView, welcomeImage,
         namesContainer, firstName, lastName,
         email,password,
         registerButton,
         quastionLabel, linkButton, logInContainer].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            welcomeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            welcomeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.30),
            welcomeImage.heightAnchor.constraint(equalTo: welcomeImage.widthAnchor),
            
            bgView.topAnchor.constraint(equalTo: welcomeImage.bottomAnchor, constant: 10),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            namesContainer.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 50),
            namesContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            namesContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            email.topAnchor.constraint(equalTo: namesContainer.bottomAnchor, constant: 40),
            email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            email.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 40),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            registerButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 90),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            logInContainer.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            logInContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
}

//MARK: - UITextFieldDelegate
extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstName.textField {
            lastName.textField.becomeFirstResponder()
        } else if textField == lastName.textField {
            email.textField.becomeFirstResponder()
        } else if textField == email.textField {
            password.textField.becomeFirstResponder()
        } else {
             view.endEditing(true)
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = password.textField.text else { return }
        
        eyeButton.isEnabled = !text.isEmpty
    }
}

#Preview {
    EmailViewController()
}
