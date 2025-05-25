import UIKit

class CustomImage: UIView {
    var nameShadowInstance: String?
    
    private let imageView = UIImageView()
    
    init(newImage: String) {
        super.init(frame: .zero)
        setupShadow()
        setupImage(newImage: newImage)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -> Setup View
extension CustomImage {
    func updateImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

//MARK: -> Setup Image
private extension CustomImage {
    func setupShadow() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
    }
    
    func setupImage(newImage: String) {
        imageView.image = UIImage(named: newImage)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        
        addSubview(imageView)
    }
}

//MARK: -> Auto Layout
private extension CustomImage {
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
