//
//  LaibelView.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class LabelView: UILabel {
    private let newText: ImageDataManager
    
    init(newText: ImageDataManager){
        self.newText = newText
        super.init(frame: .zero)
        setupLabel()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupLabel() {
        text = newText.getCurrentImage().text
        font = .systemFont(ofSize: 15, weight: .regular)
        textAlignment = .left
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}
