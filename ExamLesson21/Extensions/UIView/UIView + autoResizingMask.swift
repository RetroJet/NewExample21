import UIKit

extension UIView {
    func autoResizingMask(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
