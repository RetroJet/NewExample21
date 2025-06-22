import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let viewController = ViewController()
        let findImageViewController = FindImageViewController()
        _ = PanImageViewController()
        let licenseAgreementViewController = LicenseAgreementViewController()
        let imageListViewController = ImageListViewController()
        let marTableViewController = MarTableViewController()
        
        viewController.imageDataManager = buildImageDataManager()
        findImageViewController.imageDataManager = buildImageDataManager()
        licenseAgreementViewController.textDataManager = buildTextDataManager()
        imageListViewController.imageDataManager = buildImageDataManager()
        marTableViewController.imageDataManager = buildImageDataManager()
        
        window?.rootViewController = marTableViewController
        window?.makeKeyAndVisible()
    }
    
    private func buildImageDataManager() -> ImageDataManager {
        let imageManager = ImageManager()
        let sortedImages = imageManager.getImages().sorted(by: <)
        let imageDataManager = ImageDataManager(images: sortedImages)
        iterateImages(images: sortedImages)
        return imageDataManager
    }
    
    private func buildTextDataManager() -> TextDataManager {
        let textDataManager = TextDataManager()
        return textDataManager
    }
    
    private func iterateImages(images: [ImageModel]) {
        for image in images {
            print(image)
        }
    }
}
