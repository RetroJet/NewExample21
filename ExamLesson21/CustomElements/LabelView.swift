//
//  LaibelView.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class LabelView: UILabel {
    var nameLabelInstance: String?
    
    init(newText: String){
        super.init(frame: .zero)
        setupLabel(newText: newText)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LabelView {
    func update(text: String) {
        self.text = text
    }
    
    private func setupLabel(newText: String) {
        text = newText
        font = .systemFont(ofSize: 15, weight: .regular)
        textAlignment = .left
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}
