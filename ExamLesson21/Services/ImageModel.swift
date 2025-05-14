//
//  ImageModel.swift
//  ExamLesson21
//
//  Created by Nazar on 09.05.2025.
//

struct ImageModel {
    let imageName: String
    let text: String
}

extension ImageModel: Comparable {
    static func < (lhs: ImageModel, rhs: ImageModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}

extension ImageModel: CustomStringConvertible {
    var description: String {
        "Название картинки: \(imageName), описание: \(text)."
    }
}
