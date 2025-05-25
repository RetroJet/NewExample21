protocol IManager {
    func getImages() -> [ImageModel]
}

class ImageManager: IManager{
    func getImages() -> [ImageModel] {
        [
            ImageModel(imageName: ImageViewType.cat1.rawValue, text: TextData.firstImageText),
            ImageModel(imageName: ImageViewType.cat2.rawValue, text: TextData.secondImageText),
            ImageModel(imageName: ImageViewType.cat3.rawValue, text: TextData.thirdImageText),
            ImageModel(imageName: ImageViewType.enot1.rawValue, text: TextData.fourthImageText)
        ]
    }
}
