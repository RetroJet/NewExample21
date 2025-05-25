import UIKit

class CustomTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setupTextField()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -> UITextFieldDelegate
extension UITextFieldDelegate {
    func addTextFieldDelegate(_ views: UIView...) {
        for view in views {
            if let view = view as? CustomTextField {
                view.delegate = self
            }
        }
    }
}

//MARK: -> Setup TextField
private extension CustomTextField {
    func setupTextField() {
        placeholder = "Название картинки"
        borderStyle = .roundedRect
    }
}
