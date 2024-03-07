//
//  CustomButton.swift
//  AuthApp
//
//  Created by Татьяна Дубова on 07.03.2024.
//

import UIKit

final class CustomButton: UIButton {
    
    init(title: String, backgroundColor: UIColor, isShadow: Bool, titleColor: UIColor = .white) {
        super.init(frame: .zero)
        
        setupSelfButton(title: title,
                        backgroundColor: backgroundColor,
                        isShadow: isShadow,
                        titleColor: titleColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfButton(title: String, backgroundColor: UIColor,
                                 isShadow: Bool, titleColor: UIColor) {
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setTitleColor(.highlightedColor, for: .highlighted) //эффект цвета при нажатии на кнопку
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        layer.cornerRadius = 10
        self.backgroundColor = backgroundColor
        
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        if isShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 7
            layer.shadowOpacity = 0.4
            layer.shadowOffset = CGSize(width: 0, height: 7)
        }
    }
}

