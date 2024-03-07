//
//  LoginViewController.swift
//  AuthApp
//
//  Created by Татьяна Дубова on 07.03.2024.
//

import UIKit

//MARK: - LoginViewController
class LoginViewController: UIViewController {
    
    //MARK: - Private Property
    private let bgView = UIView()
    
    private let welcomeImage = UIImageView()
    
    private let email = LabeledTextField(title: "Email", placeholder: "Enter your email")
    private let password = LabeledTextField(title: "Password", placeholder: "Enter your password", isPrivate: true)
    
    private let imageName = EyeButton()
    
    private let logInButton = CustomButton(title: "Log In", backgroundColor: .white, isShadow: true, titleColor: .black)
    
    private let quastionLabel = CustomLabel(title: "Need an account?")
    
    private let linkButton = UIButton()
    private let eyeButton = EyeButton()

    private let singUpContainer = UIStackView()
    
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
private extension LoginViewController {
    func setupView() {
        settingView()
        
        addSubViews()
        addActions()
        
        appointDelegate()
        
        setupPasswordTF()
        setupBgView()
        setupLogoImage()
        setupLinkButton()
        
        setupSingUpContainer()
        
        setupLayout()
    }
    
    func settingView() {
        view.backgroundColor = .systemYellow
    }
}

//MARK: - Setting
private extension LoginViewController {
    func addSubViews() {
        [welcomeImage, bgView, email, password,
         logInButton, singUpContainer].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func addActions() {
        eyeButton.addTarget(self, action: #selector(displayBookmarks), for: .touchUpInside)
    }
    
    func appointDelegate() {
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
        linkButton.setTitle("Sing Up", for: .normal)
        linkButton.setTitleColor(.systemPink, for: .normal)
        linkButton.setTitleColor(.highlightedColor, for: .highlighted)
        linkButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
    }
    
    func setupContainer(stackView: UIStackView, topLabel: UIView) {
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(topLabel)
    }
    
    func setupSingUpContainer() {
        singUpContainer.axis = .horizontal
        
        singUpContainer.addArrangedSubview(quastionLabel)
        singUpContainer.addArrangedSubview(linkButton)
    }
}

//MARK: - Layout
private extension LoginViewController {
    func setupLayout() {
        [bgView, welcomeImage, email,
         password, logInButton, quastionLabel,
         linkButton, singUpContainer].forEach { subView in
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
            
            email.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 40),
            email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            email.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 40),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            logInButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 90),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            singUpContainer.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            singUpContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            singUpContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email.textField {
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
    LoginViewController()
}

