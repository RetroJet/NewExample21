//
//  LaibelView.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class LabelView: UILabel {
    
    init(textName: String){
        super.init(frame: .zero)
        setupLabel(textName)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(_ textLabel: String) {
        text = textLabel
        font = .systemFont(ofSize: 15, weight: .regular)
        textAlignment = .left
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}
