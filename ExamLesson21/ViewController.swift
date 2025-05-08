//
//  ViewController.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class ViewController: UIViewController {
    private let shadowView = ShadowView(ImageName: ShadowViewType.cat.rawValue)
    private let textLabel = LabelView(textName: TextData.mainText)
    private let stackViewLabel = UIStackView()
    private let stackViewButton = UIStackView()
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
        view.addSubview(stackViewLabel)
        view.addSubview(stackViewButton)
        view.addSubview(firstButton)
        setupStackView()
        
        
        
        setupLayout()
    }
}

//MARK: - Nested Types
enum ShadowViewType: String {
    case cat = "cat"
}


//MARK: - Setup View
extension ViewController {
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupStackView() {
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .fill
        stackViewLabel.alignment = .center
        stackViewLabel.spacing = 40
        
        stackViewButton.axis = .horizontal
        stackViewButton.distribution = .fillEqually
        stackViewButton.alignment = .fill
        stackViewButton.spacing = 60
        
        stackViewLabel.addArrangedSubview(shadowView)
        stackViewLabel.addArrangedSubview(textLabel)
        
        stackViewButton.addArrangedSubview(lastButton)
        stackViewButton.addArrangedSubview(nextButton)
    }
    
}

private extension ViewController {
    func setupLayout() {
        stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        lastButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            shadowView.heightAnchor.constraint(equalToConstant: 200),
            shadowView.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.widthAnchor.constraint(equalToConstant: 250),
            
            stackViewButton.bottomAnchor.constraint(equalTo: stackViewLabel.bottomAnchor, constant: 120),
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButton.widthAnchor.constraint(equalToConstant: 250),
            stackViewButton.heightAnchor.constraint(equalToConstant: 30),
            
            firstButton.bottomAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 200),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

