import UIKit

class LicenseAgreementViewController: UIViewController {
    var textDataManager: IDataTextManager?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let separator = UIView()
    
    private lazy var titleLabel = CustomLabel(
        newText: textDataManager?.getLicenseText().title ?? "",
        font: .boldSystemFont(ofSize: 16)
    )
    private lazy var bodyLabel = CustomLabel(
        newText: textDataManager?.getLicenseText().body ?? "",
        font: .boldSystemFont(ofSize: 16)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor()
        setupLabel()
        setupSeparatop()
        addAllSubviews()
        setupLayout()
    }
}

//MARK: -> Setup View
private extension LicenseAgreementViewController {
    func backgroundColor() {
        view.backgroundColor = .white
        contentView.backgroundColor = .white
    }
    
    func addAllSubviews() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(
            titleLabel,
            separator,
            bodyLabel
        )
    }
    
    func setupLabel() {
        bodyLabel.textAlignment = .left
    }
    
    func setupSeparatop() {
        separator.backgroundColor = .lightGray
    }
}

//MARK: -> AutoLayout
private extension LicenseAgreementViewController {
    func setupLayout() {
        [scrollView,
         contentView,
         titleLabel,
         separator,
         bodyLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: bodyLabel.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            separator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            bodyLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            bodyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
