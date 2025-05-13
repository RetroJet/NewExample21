//
//  Untitled.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class ShadowView: UIView {
    private let imageView = UIImageView()
    
    init(newImage: String) {
        super.init(frame: .zero)
        setupView()
        setupImage(newImage: newImage)
        
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Setup View
extension ShadowView {
    func updateImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
    }
    
    private func setupImage(newImage: String) {
        imageView.image = UIImage(named: newImage)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        
        addSubview(imageView)
    }
}

//MARK: Auto Layout
private extension ShadowView {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
