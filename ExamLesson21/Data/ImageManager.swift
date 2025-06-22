protocol IManager {
    func getImages() -> [ImageModel]
}

class ImageManager: IManager{
    func getImages() -> [ImageModel] {
        [
            ImageModel(imageName: ImageViewType.cat1.rawValue, text: TextData.firstImageText, isMark: true),
            ImageModel(imageName: ImageViewType.cat2.rawValue, text: TextData.secondImageText, isMark: false),
            ImageModel(imageName: ImageViewType.cat3.rawValue, text: TextData.thirdImageText, isMark: false),
            ImageModel(imageName: ImageViewType.enot1.rawValue, text: TextData.fourthImageText, isMark: true)
        ]
    }
}
