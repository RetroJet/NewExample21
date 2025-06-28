import UIKit

class ImageDescriptionCell: UITableViewCell {
    var actionButton: ((UITableViewCell) -> ())?
    
    private let customView = CustomView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: ImageModel) {
        customView.configure(data: data)
        customView.actionButton = toggleCheckMarkCell
    }
    
    @objc
    private func toggleCheckMarkCell() {
        actionButton?(self)
    }
}

//MARK: -> Setup ContentViews
private extension ImageDescriptionCell {
    func setup() {
        setupBackgroundColor()
        addSubview()
        setupLayout()
    }
    
    func addSubview() {
        contentView.addSubviews(customView)
    }
    
    func setupBackgroundColor() {
        contentView.backgroundColor = .darkGray
    }
}

//MARK: -> Auto Layout
private extension ImageDescriptionCell {
    func setupLayout() {
        
        autoResizingMask(customView)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
