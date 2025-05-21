struct ImageModel {
    let imageName: String
    let text: String
}

//MARK: -> Comparable
extension ImageModel: Comparable {
    static func < (lhs: ImageModel, rhs: ImageModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}

//MARK: -> CustomStringConvertible
extension ImageModel: CustomStringConvertible {
    var description: String {
        "Название картинки: \(imageName), описание: \(text)."
    }
}
