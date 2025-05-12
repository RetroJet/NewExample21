//
//  ImageManager 2.swift
//  ExamLesson21
//
//  Created by Nazar on 09.05.2025.
//

class ImageManager{
    func getImages() -> [ImageModel] {
        [
            ImageModel(imageName: ShadowViewType.cat1.rawValue, text: TextData.firstImageText),
            ImageModel(imageName: ShadowViewType.cat2.rawValue, text: TextData.secondImageText),
            ImageModel(imageName: ShadowViewType.cat3.rawValue, text: TextData.thirdImageText),
        ]
    }
}
