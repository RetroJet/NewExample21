//
//  ViewController.swift
//  ExamLesson21
//
//  Created by Nazar on 04.05.2025.
//

import UIKit

class ViewController: UIViewController {
    var imageDataManager: IDataManager?
    
    private lazy var currentData = imageDataManager?.getCurrentImage()
    
    private let stackViewLabel = UIStackView()
    private let stackViewButton = UIStackView()
    
    private lazy var shadowView = ShadowView(newImage: currentData?.imageName ?? "")
    private lazy var textLabel = LabelView(newText: currentData?.text ?? "")
    
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
        view.addSubviews(
            stackViewLabel,
            stackViewButton,
            firstButton
        )
        setupStackView()
        setupLayout()
    }
}

//MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        switch button {
        case lastButton:
            let imageModel = imageDataManager?.getLastImage()
            updateModel(imageModel)
            print("lastButton pressed")
        case nextButton:
            let imageModel = imageDataManager?.getNextImage()
            updateModel(imageModel)
            print("nextButton pressed")
        case firstButton:
            let imageModel = imageDataManager?.getFirstImage()
            updateModel(imageModel)
            print("firstButton pressed")
        default:
            break
        }
    }
}

//MARK: - Setup View
private extension ViewController {
    func updateModel(_ model: ImageModel?) {
        shadowView.updateImage(imageName: model?.imageName ?? "")
        textLabel.update(text: model?.text ?? "")
    }
    
    func setupBackground() {
        view.backgroundColor = .white
    }
    
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
            shadowView,
            textLabel
        )
        
        stackViewButton.addArrangedSubviews(
            lastButton,
            nextButton
        )
    }
}

//MARK: Auto Layout
private extension ViewController {
    func setupLayout() {
        [stackViewLabel,
         stackViewButton,
         shadowView,
         textLabel,
         firstButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            shadowView.heightAnchor.constraint(equalToConstant: 200),
            shadowView.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.widthAnchor.constraint(equalToConstant: 250),
            
            
            stackViewButton.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 200),
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButton.widthAnchor.constraint(equalToConstant: 250),
            stackViewButton.heightAnchor.constraint(equalToConstant: 30),
            
            firstButton.bottomAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 200),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
