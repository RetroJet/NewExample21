import UIKit

class FindImageViewController: UIViewController {
    var imageDataManager: IDataManager?
    
    private let stackViewLabel = UIStackView()
    
    private var mainLabel = CustomLabel(
        newText: TextView.inputText,
        font: .systemFont(ofSize: 18, weight: .regular)
    )
    
    private let mainTextField = CustomTextField()
    private let mainButton = CustomButton(
        titleNormal: "Проверить",
        titleColor: .systemCyan,
        colorButton: .white
    )
    
    private lazy var imageView = CustomImage(newImage: "")
    private lazy var textLabel = CustomLabel(
        newText: "",
        font: .systemFont(ofSize: 15, weight: .regular)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addTextFieldDelegates()
        addButtonDelegates()
        addAllSubviews()
        setupStackView()
        setupLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mainTextField.resignFirstResponder()
    }
}

//MARK: -> ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        updateModel(imageDataManager?.getNecessaryImage(text: mainTextField.text ?? ""))
        mainTextField.resignFirstResponder()
    }
}

//MARK: -> UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateModel(imageDataManager?.getNecessaryImage(text: mainTextField.text ?? ""))
        view.endEditing(true)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let model = imageDataManager?.getNecessaryImage(text: mainTextField.text ?? "")
        
        if model != nil {
            mainLabel.update(text: TextView.positiveRespondText)
        } else {
            mainLabel.update(text: TextView.negativeRespondText)
        }
        mainTextField.text = ""
    }
}

//MARK: -> Setup View
private extension FindImageViewController {
    func setupBackground() {
        view.backgroundColor = .white
    }
    
    func addAllSubviews() {
        view.addSubviews(
            mainLabel,
            mainTextField,
            mainButton,
            stackViewLabel
        )
    }
    
    func addTextFieldDelegates() {
        addTextFieldDelegate(
            mainTextField
        )
    }
    
    func addButtonDelegates() {
        addButtonDelegate(
            mainButton
        )
    }
    
    func updateModel(_ model: ImageModel?) {
        imageView.updateImage(imageName: model?.imageName ?? "")
        textLabel.update(text: model?.text ?? "")
    }
}

//MARK: -> Setup StackView
private extension FindImageViewController {
    func setupStackView() {
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .fill
        stackViewLabel.alignment = .center
        stackViewLabel.spacing = 40
        
        stackViewLabel.addArrangedSubviews(
            imageView,
            textLabel
        )
    }
}

//MARK: -> AutoLayout
private extension FindImageViewController {
    func setupLayout() {
        [mainLabel,
         mainTextField,
         mainButton,
         stackViewLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainTextField.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 90),
            mainTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            mainButton.topAnchor.constraint(equalTo: mainTextField.bottomAnchor, constant: 30),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.widthAnchor.constraint(equalToConstant: 250),
            
            stackViewLabel.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 50),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewLabel.heightAnchor.constraint(equalToConstant: 300),
            stackViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
}

