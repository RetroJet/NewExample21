import UIKit

class PanImageViewController: UIViewController {
    private let image = CustomImage(newImage: ImageViewType.enot1.rawValue)
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var topConstraint: NSLayoutConstraint!
    private var centerXConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupImage()
        setupLayout()
        setupGestureRecognizer()
    }
    
    @objc
    func handlePanGesture(_ gestureRecognizer: UIGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else { return }
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            topConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .ended, .cancelled:
            panGestureAnchorPoint = nil
        case .possible, .failed:
            break
        @unknown default:
            break
        }
        
    }
}

//MARK: -> SetupView
private extension PanImageViewController {
    func setupImage() {
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        
        view.addSubview(image)
    }
    
    func setupGestureRecognizer() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        
        image.addGestureRecognizer(panGestureRecognizer)
    }
}

//MARK: -> AutoLayout
private extension PanImageViewController {
    func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = image.widthAnchor.constraint(
            equalToConstant: Constants.initialImageDimSize
        )
        
        let heightConstraint = image.heightAnchor.constraint(
            equalToConstant: Constants.initialImageDimSize
        )
        
        topConstraint = image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        centerXConstraint = image.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            topConstraint,
            centerXConstraint
        ])
    }
}

private extension PanImageViewController {
    enum Constants {
        static let initialImageDimSize = 150.0
    }
}

