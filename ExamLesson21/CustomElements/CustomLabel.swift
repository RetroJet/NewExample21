import UIKit

class CustomLabel: UILabel {
    var nameLabelInstance: String?
    
    init(newText: String, font: UIFont){
        super.init(frame: .zero)
        setupLabel(newText: newText, font: font)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -> Setup View
extension CustomLabel {
    func update(text: String) {
        self.text = text
    }
}

//MARK: -> Setup Label
private extension CustomLabel {
    func setupLabel(newText: String, font: UIFont) {
        text = newText
        self.font = font
        textAlignment = .center
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        isHidden = false
    }
}
