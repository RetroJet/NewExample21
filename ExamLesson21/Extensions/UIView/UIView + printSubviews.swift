import UIKit

extension UIView {
    func printAllSubview(_ views: UIView...) -> Int {
        var count = 0
        
        for view in views {
            if view is CustomButton {
                count += 1
            }
        }
        return count
    }
    
    func printNameOfSubview(_ views: UIView...) {
        for view in views {
            if let button = view as? CustomButton {
                print(button.nameButtonInstance ?? "Unowned name")
            } else if let image = view as? CustomImage {
                print(image.nameShadowInstance ?? "Unowned name")
            } else if let label = view as? CustomLabel {
                print(label.nameLabelInstance ?? "Unowned name")
            }
        }
    }
}
