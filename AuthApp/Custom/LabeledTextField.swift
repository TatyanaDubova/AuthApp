//
//  LabeledTextField.swift
//  AuthApp
//
//  Created by Татьяна Дубова on 07.03.2024.
//

import UIKit

//MARK: - RegisterTextField
final class LabeledTextField: UIView {
    
    private let label = UILabel()
    let textField = PaddingTextField()
    
//    var delegate: UITextFieldDelegate? {
//        get { textField.delegate }
//        set { textField.delegate = newValue }
//    }
    
    //MARK: - Initializer
    init(title: String, placeholder: String, isPrivate: Bool = false) {
        super.init(frame: .zero)
        setupSelfLabel(title: title)
        setupTextField(placeholder: placeholder, isPrivate: isPrivate)
        
        addSubview(label)
        addSubview(textField)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods Setup Label
    private func setupSelfLabel(title: String) {
        label.text = title
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
    }
    
    //MARK: - Private Methods Setup TextField
    private func setupTextField(placeholder: String, isPrivate: Bool) {
        textField.textColor = .white
        tintColor = .white

        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        
        textField.font = .boldSystemFont(ofSize: 18)
        
        textField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        if isPrivate {
            textField.isSecureTextEntry = true
        }
    }
}

