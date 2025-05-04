//
//  ViewController.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class ViewController: UIViewController {
    private let shadowView = ShadowView(ImageName: ShadowViewType.cat.rawValue)
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupStackView()
        view.addSubview(stackView)
        
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
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(shadowView)
    }
}

private extension ViewController {
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            shadowView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 70),
            shadowView.heightAnchor.constraint(equalToConstant: 200),
            shadowView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
