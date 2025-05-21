import UIKit

class CustomLabel: UILabel {
    var nameLabelInstance: String?
    
    init(newText: String){
        super.init(frame: .zero)
        setupLabel(newText: newText)
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
    func setupLabel(newText: String) {
        text = newText
        font = .systemFont(ofSize: 15, weight: .regular)
        textAlignment = .left
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}
