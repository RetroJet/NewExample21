import Foundation

protocol IDataManager {
    func getCurrentImage() -> ImageModel
    func getLastImage() -> ImageModel
    func getNextImage() -> ImageModel
    func getFirstImage() -> ImageModel
    func getNecessaryImage(text: String) -> ImageModel?
    func getAllImages() -> [ImageModel]
    func getMarkedImages() -> [ImageModel]
    func saveStatusImages(_ image: ImageModel)
    func removeImage(index: Int)
    func loadImageMarks()
    func toggleMark(index: Int)
    func toggleCheckMarker(_ image: ImageModel)
}

class ImageDataManager {
    private var images: [ImageModel] = []
    private var currentIndex = 0
    
    init(images: [ImageModel]) {
        self.images = images
        loadImageMarks()
    }
}

//MARK: -> IDataManager
extension ImageDataManager: IDataManager {
    func getCurrentImage() -> ImageModel {
        images[currentIndex]
    }
    
    func getLastImage() -> ImageModel {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        return getCurrentImage()
    }
    
    func getNextImage() -> ImageModel {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
        return getCurrentImage()
    }
    
    func getFirstImage() -> ImageModel {
        currentIndex = 0
        return getCurrentImage()
    }
    
    func getNecessaryImage(text: String) -> ImageModel? {
        for image in images {
            if image.imageName == text {
                return image
            }
        }
        return nil
    }
    
    func getAllImages() -> [ImageModel] {
        images
    }
    
    func getMarkedImages() -> [ImageModel] {
        var isMarkedImages: [ImageModel] = []
        for image in images {
            if image.isMark {
                isMarkedImages.append(image)
            }
        }
        return isMarkedImages
    }
    
    func saveStatusImages(_ image: ImageModel) {
        let key = "\(image.imageName)"
        UserDefaults.standard.set(image.isMark, forKey: key)
    }
    
    func removeImage(index: Int) {
        images.remove(at: index)
    }
    
    func loadImageMarks() {
        for i in 0..<images.count {
            let key = "\(images[i].imageName)"
            if let saved = UserDefaults.standard.value(forKey: key) as? Bool {
                images[i].isMark = saved
            }
        }
    }
    
    func toggleMark(index: Int) {
        if images.indices.contains(index) {
            images[index].isMark.toggle()
        }
    }
    
    func toggleCheckMarker(_ image: ImageModel) {
        if let index = images.firstIndex(of: image) {
            images[index].isMark.toggle()
            saveStatusImages(images[index])
        }
    }
}
