//
//  ViewController.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class ViewController: UIViewController {
    private let shadowView = ShadowView(ImageName: ShadowViewType.cat.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        view.addSubview(shadowView)
        
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
}

private extension ViewController {
    func setupLayout() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            shadowView.heightAnchor.constraint(equalToConstant: 100),
            shadowView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
