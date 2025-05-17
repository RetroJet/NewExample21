//
//  UIView + ButtonDelegate.swift
//  ExamLesson21
//
//  Created by Nazar on 17.05.2025.
//

import UIKit

extension ICustomButtonDelegate {
    func addDelegate(_ views: UIView...) {
        for view in views {
            if let view = view as? CustomButton {
                view.delegate = self
            }
        }
    }
}
