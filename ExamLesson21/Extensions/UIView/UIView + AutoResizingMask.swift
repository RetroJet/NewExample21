import UIKit

extension UIView {
    func AutoResizingMask(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
