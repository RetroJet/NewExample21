import UIKit

class ImageDescriptionCell: UITableViewCell {
    var actionButton: ((UITableViewCell) -> ())?
    
    private let imageCell = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let checkMarkButton = UIButton()
    private var toggleCheckMark: Bool!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
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
        
        let checkBox = toggleCheckMark ? "checkmark.square.fill" : "checkmark.square"
        checkMarkButton.setImage(UIImage(systemName: checkBox), for: .normal)
    }
    
    @objc
    private func toggleCheckMarkCell() {
        toggleCheckMark.toggle()
        let checkMark = toggleCheckMark ? "checkmark.square.fill" : "checkmark.square"
        checkMarkButton.setImage(UIImage(systemName: checkMark), for: .normal )
        actionButton?(self)
    }
}

//MARK: -> Setup Views
private extension ImageDescriptionCell {
    func setup() {
        setupCheckBoxButton()
        setupImageProduct()
        setupDescription()
        setupTitle()
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        contentView.addSubviews(
            imageCell,
            titleLabel,
            descriptionLabel,
            checkMarkButton
        )
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
private extension ImageDescriptionCell {
    func setupLayout() {
        AutoResizingMask(
            imageCell,
            titleLabel,
            descriptionLabel,
            checkMarkButton
        )
        
        NSLayoutConstraint.activate([
            imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            checkMarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkMarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
}
