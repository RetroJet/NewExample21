import UIKit

protocol ICustomButtonDelegate {
    func pressedButton(_ button: UIButton)
}

class CustomButton: UIButton {
    var nameButtonInstance: String?
    var delegate: ICustomButtonDelegate?
    
    private var shouldAddShadow: Bool
    
    init(titleNormal: String, titleColor: UIColor, colorButton: UIColor, shouldAddShadow: Bool = false){
        self.shouldAddShadow = shouldAddShadow
        super.init(frame: .zero)
        setupButton(titleNormal: titleNormal, titleColor: titleColor, colorButton: colorButton)
        addAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}

//MARK: -> ICustomButtonDelegate
extension ICustomButtonDelegate {
    func addDelegate(_ views: UIView...) {
        for view in views {
            if let view = view as? CustomButton {
                view.delegate = self
            }
        }
    }
}

//MARK: -> Setup Action
private extension CustomButton {
    func addAction() {
        let action = UIAction { _ in
            self.delegate?.pressedButton(self)
        }
        addAction(action, for: .touchUpInside)
    }
}

//MARK: -> Setup Button
private extension CustomButton {
    func setupButton(titleNormal: String, titleColor: UIColor, colorButton: UIColor) {
        setTitle(titleNormal, for: .normal)
        setTitle("", for: .highlighted)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        backgroundColor = colorButton
        layer.cornerRadius = 10
        
        if shouldAddShadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize.init(width: 0, height: 5)
            layer.shadowRadius = 5
        }
    }
}

