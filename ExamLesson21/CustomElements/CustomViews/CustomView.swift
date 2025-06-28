import UIKit

class CustomView: UIView {
    var actionButton: (() -> ())?
    
    private let imageCell = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let checkMarkButton = UIButton()
    private var toggleCheckMark: Bool!
    
    var checkMarkStatus: String {
        toggleCheckMark ? "checkmark.square.fill" : "checkmark.square"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(
            withDuration: 0.04) {
                self.alpha = 0.6
            } completion: { _ in
                self.alpha = 1
            }
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: ImageModel) {
        imageCell.image = UIImage(named: data.imageName)
        titleLabel.text = data.imageName
        descriptionLabel.text = data.text
        toggleCheckMark = data.isMark
        
        let checkBox = checkMarkStatus
        checkMarkButton.setImage(UIImage(systemName: checkBox), for: .normal)
    }
    
    @objc
    private func toggleCheckMarkCell() {
        toggleCheckMark.toggle()
        let checkMark = checkMarkStatus
        checkMarkButton.setImage(UIImage(systemName: checkMark), for: .normal )
        actionButton?()
    }
}

//MARK: -> Setup Views
private extension CustomView {
    func setup() {
        setupView()
        setupBackgroundColor()
        setupCheckBoxButton()
        setupImageProduct()
        setupDescription()
        setupTitle()
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        addSubviews(
            imageCell,
            titleLabel,
            descriptionLabel,
            checkMarkButton
        )
    }
    
    func setupView() {
        layer.cornerRadius = 20
    }
    
    func setupBackgroundColor() {
        backgroundColor = .white
    }
    
    func setupTitle() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    func setupDescription() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 16)
    }
    
    func setupImageProduct() {
        imageCell.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageCell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageCell.contentMode = .scaleAspectFill
    }
    
    func setupCheckBoxButton() {
        checkMarkButton.tintColor = .systemCyan
        checkMarkButton.contentHorizontalAlignment = .fill
        checkMarkButton.contentVerticalAlignment = .fill
        checkMarkButton.imageView?.contentMode = .scaleAspectFill
        checkMarkButton.clipsToBounds = true
        checkMarkButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        checkMarkButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        checkMarkButton.addTarget(self, action: #selector(toggleCheckMarkCell), for: .touchUpInside)
    }
}

//MARK: -> Auto Layout
private extension CustomView {
    func setupLayout() {
        autoResizingMask(
            imageCell,
            titleLabel,
            descriptionLabel,
            checkMarkButton
        )
        
        let topConstraint = imageCell.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        topConstraint.priority = .defaultLow
        
        let bottomConstraint = imageCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        bottomConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            imageCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topConstraint,
            bottomConstraint,
            
            titleLabel.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            checkMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkMarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
}

