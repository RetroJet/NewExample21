//
//  ViewController.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class ViewController: UIViewController {
    private lazy var shadowView = ShadowView(newImage: imageDataManager)
    private lazy var textLabel = LabelView(newText: imageDataManager)
    
    private let stackViewLabel = UIStackView()
    private let stackViewButton = UIStackView()
    
    private let imageManager = ImageManager().getImages()
    private lazy var imageDataManager = ImageDataManager(images: imageManager)
    
    private let lastButton = CustomButton(
        titleNormal: "Last",
        titleColor: .white,
        colorButton: .systemTeal,
        shouldAddShadow: true
    )
    private let nextButton = CustomButton(
        titleNormal: "Next",
        titleColor: .black,
        colorButton: .white,
        shouldAddShadow: true
    )
    private let firstButton = CustomButton(
        titleNormal: "First",
        titleColor: .white,
        colorButton: .systemPink
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        view.addSubviews(
            stackViewLabel,
            stackViewButton,
            firstButton
        )
        setupStackView()
        addAction()
        setupLayout()
    }
}

//MARK: - Setup View
private extension ViewController {
    func addAction() {
        let actionLastButton = UIAction { _ in
            _ = self.imageDataManager.getLastImage()
            self.shadowView.setupImage()
            self.textLabel.setupLabel()
        }
        
        let actionNextButton = UIAction { _ in
            _ = self.imageDataManager.getNextImage()
            self.shadowView.setupImage()
            self.textLabel.setupLabel()
        }
        
        let actionFirstButton = UIAction { _ in
            _ = self.imageDataManager.getFirstImage()
            self.shadowView.setupImage()
            self.textLabel.setupLabel()
        }
        lastButton.addAction(actionLastButton, for: .touchUpInside)
        nextButton.addAction(actionNextButton, for: .touchUpInside)
        firstButton.addAction(actionFirstButton, for: .touchUpInside)
    }
    
    func setupBackground() {
        view.backgroundColor = .white
    }
    
    func setupStackView() {
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .fill
        stackViewLabel.alignment = .center
        stackViewLabel.spacing = 40
        
        stackViewButton.axis = .horizontal
        stackViewButton.distribution = .fillEqually
        stackViewButton.alignment = .fill
        stackViewButton.spacing = 60
        
        stackViewLabel.addArrangedSubviews(
            shadowView,
            textLabel
        )
        
        stackViewButton.addArrangedSubviews(
            lastButton,
            nextButton
        )
    }
}

//MARK: Auto Layout
private extension ViewController {
    func setupLayout() {
        disableAutoresizing(views:
            stackViewLabel,
            stackViewButton,
            shadowView,
            textLabel,
            firstButton
        )
        
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            shadowView.heightAnchor.constraint(equalToConstant: 200),
            shadowView.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.widthAnchor.constraint(equalToConstant: 250),
            
            
            stackViewButton.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 200),
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButton.widthAnchor.constraint(equalToConstant: 250),
            stackViewButton.heightAnchor.constraint(equalToConstant: 30),
            
            firstButton.bottomAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 200),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

