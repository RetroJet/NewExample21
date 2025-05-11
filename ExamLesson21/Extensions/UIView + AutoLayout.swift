//
//  UIView + Auto.swift
//  ExamLesson21
//
//  Created by Nazar on 11.05.2025.
//

import UIKit

extension UIViewController {
    func disableAutoresizing(views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

