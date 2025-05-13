//
//  ImageModel.swift
//  ExamLesson21
//
//  Created by Nazar on 09.05.2025.
//

struct ImageModel: Comparable, CustomStringConvertible {
    let imageName: String
    let text: String
    
    var description: String {
        "Название картинки: \(imageName), описание: \(text)."
    }
    
    static func < (lhs: ImageModel, rhs: ImageModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}
