import UIKit

class ImageCell: UITableViewCell {
    private let imageCell = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let checkBoxButton = UIButton()
    
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
        
        let checkBox = data.isMark ? "checkmark.square.fill" : "checkmark.square"
        checkBoxButton.setImage(UIImage(systemName: checkBox), for: .normal)
    }
}

//MARK: -> Setup Views
private extension ImageCell {
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
            checkBoxButton
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
        checkBoxButton.tintColor = .systemCyan
        checkBoxButton.contentHorizontalAlignment = .fill
        checkBoxButton.contentVerticalAlignment = .fill
        checkBoxButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        checkBoxButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

//MARK: -> Auto Layout
private extension ImageCell {
    func setupLayout() {
        AutoResizingMask(
            imageCell,
            titleLabel,
            descriptionLabel,
            checkBoxButton
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
            
            checkBoxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkBoxButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
}
