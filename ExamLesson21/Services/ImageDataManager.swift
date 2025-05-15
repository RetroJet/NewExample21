//
//  ImageDataManager.swift
//  ExamLesson21
//
//  Created by Nazar on 09.05.2025.
//

protocol IDataManager {
    func getCurrentImage() -> ImageModel
    func getLastImage() -> ImageModel
    func getNextImage() -> ImageModel
    func getFirstImage() -> ImageModel
}

class ImageDataManager: IDataManager {
    private var images: [ImageModel] = []
    private var currentIndex = 0
    
    init(images: [ImageModel]) {
        self.images = images
    }
    
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
}
