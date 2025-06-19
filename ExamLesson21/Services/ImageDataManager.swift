protocol IDataManager {
    func getCurrentImage() -> ImageModel
    func getLastImage() -> ImageModel
    func getNextImage() -> ImageModel
    func getFirstImage() -> ImageModel
    func getNecessaryImage(text: String) -> ImageModel?
    func getAllImages() -> [ImageModel]
    func removeImage(index: Int)
    func toggleMark(index: Int)
}

class ImageDataManager {
    private var images: [ImageModel] = []
    private var currentIndex = 0
    
    init(images: [ImageModel]) {
        self.images = images
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
    
    func removeImage(index: Int) {
        images.remove(at: index)
    }
    
    func toggleMark(index: Int) {
        if images.indices.contains(index) {
            images[index].isMark.toggle()
        }
    }
}
