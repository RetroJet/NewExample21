import UIKit

class ViewController: UIViewController {
    var imageDataManager: IDataManager?
    
    private let stackViewLabel = UIStackView()
    private let stackViewButton = UIStackView()
    
    private lazy var currentData = imageDataManager?.getCurrentImage()
    private lazy var imageView = CustomImage(newImage: currentData?.imageName ?? "")
    private lazy var textLabel = CustomLabel(newText: currentData?.text ?? "")
    
    private let lastButton = CustomButton(
        titleNormal: "Last",
        titleColor: .white,
        colorButton: .systemTeal,
        shouldAddShadow: true
    )
    private let nextButton = CustomButton(
        titleNormal: "Next",
        titleColor: .black,
        colorButton: .white,
        shouldAddShadow: true
    )
    private let firstButton = CustomButton(
        titleNormal: "First",
        titleColor: .white,
        colorButton: .systemPink
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addDelagates()
        imageView.nameShadowInstance = "ShadowView"
        textLabel.nameLabelInstance = "TextLabel"
        lastButton.nameButtonInstance = "LastButton"
        nextButton.nameButtonInstance = "NextButton"
        firstButton.nameButtonInstance = "FirstButton"
        printAllSubviews()
        printNameOfSubview()
        addAllSubviews()
        setupStackView()
        setupLayout()
    }
}

//MARK: -> ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        switch button {
        case lastButton:
            let imageModel = imageDataManager?.getLastImage()
            updateModel(imageModel)
        case nextButton:
            let imageModel = imageDataManager?.getNextImage()
            updateModel(imageModel)
        case firstButton:
            let imageModel = imageDataManager?.getFirstImage()
            updateModel(imageModel)
        default:
            break
        }
    }
}

//MARK: -> Setup View
private extension ViewController {
    func setupBackground() {
        view.backgroundColor = .white
    }
    
    func addDelagates() {
        addDelegate(
            lastButton,
            nextButton,
            firstButton
        )
    }
    
    func printAllSubviews() {
        let result = view.printAllSubview(
            lastButton,
            nextButton,
            firstButton,
            imageView,
            textLabel
        )
        print(result)
    }
    
    func printNameOfSubview() {
        view.printNameOfSubview(
            lastButton,
            nextButton,
            firstButton,
            imageView,
            textLabel
        )
    }
    
    func addAllSubviews() {
        view.addSubviews(
            stackViewLabel,
            stackViewButton,
            firstButton
        )
    }
    
    func updateModel(_ model: ImageModel?) {
        imageView.updateImage(imageName: model?.imageName ?? "")
        textLabel.update(text: model?.text ?? "")
    }
}

//MARK: -> Setup StackView
private extension ViewController {
    func setupStackView() {
        stackViewLabel.axis = .vertical
        stackViewLabel.distribution = .fill
        stackViewLabel.alignment = .center
        stackViewLabel.spacing = 40
        
        stackViewButton.axis = .horizontal
        stackViewButton.distribution = .fillEqually
        stackViewButton.alignment = .fill
        stackViewButton.spacing = 60
        
        stackViewLabel.addArrangedSubviews(
            imageView,
            textLabel
        )
        
        stackViewButton.addArrangedSubviews(
            lastButton,
            nextButton
        )
    }
}

//MARK: -> AutoLayout
private extension ViewController {
    func setupLayout() {
        [stackViewLabel,
         stackViewButton,
         imageView,
         textLabel,
         firstButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.widthAnchor.constraint(equalToConstant: 250),
            
            stackViewButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 200),
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButton.widthAnchor.constraint(equalToConstant: 250),
            stackViewButton.heightAnchor.constraint(equalToConstant: 30),
            
            firstButton.bottomAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 200),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
