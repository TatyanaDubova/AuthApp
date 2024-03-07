//
//  CustomLabel.swift
//  AuthApp
//
//  Created by Татьяна Дубова on 07.03.2024.
//

import UIKit

final class CustomLabel: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        
        setupSelfLabel(title: title)
    }
    
    //Инициализатор заглушка, который идет в паре с первым инициализатором
    //Не активный инициализатор, который использовать не будем (тк нет сторибордов)
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfLabel(title: String) {
        text = title
        font = .boldSystemFont(ofSize: 18)
        textColor = .white
    }
}
