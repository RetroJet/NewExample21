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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        view.addSubview(stackViewLabel)
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
        stackViewLabel.distribution = .equalSpacing
        stackViewLabel.alignment = .center
        stackViewLabel.spacing = 20
        
        stackViewButton.axis = .vertical
        stackViewButton.distribution = .equalSpacing
        stackViewButton.alignment = .center
        stackViewButton.spacing = 20
        
        stackViewLabel.addArrangedSubview(shadowView)
        stackViewLabel.addArrangedSubview(textLabel)
    }
    
}

private extension ViewController {
    func setupLayout() {
        stackViewLabel.translatesAutoresizingMaskIntoConstraints = false
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            shadowView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            shadowView.heightAnchor.constraint(equalToConstant: 200),
            shadowView.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.widthAnchor.constraint(equalToConstant: 230)
        ])
    }
}

