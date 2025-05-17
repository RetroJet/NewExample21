//
//  UIView + Print.swift
//  ExamLesson21
//
//  Created by Nazar on 17.05.2025.
//

import UIKit

extension UIView {
    func printAllSubviews(_ views: UIView...) -> Int {
        var count = 0
        
        for view in views {
            if view is CustomButton {
                count += 1
            }
        }
        return count
    }
    
    func printNameOfSubviews(_ views: UIView...) {
        for view in views {
            if let button = view as? CustomButton {
                print(button.nameButtonInstance ?? "Unowned name")
            } else if let image = view as? ShadowView {
                print(image.nameShadowInstance ?? "Unowned name")
            } else if let label = view as? LabelView {
                print(label.nameLabelInstance ?? "Unowned name")
            }
        }
    }
}
