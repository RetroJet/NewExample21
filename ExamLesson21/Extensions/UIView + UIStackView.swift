//
//  UIView + UIStackView.swift
//  ExamLesson21
//
//  Created by Nazar on 09.05.2025.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
