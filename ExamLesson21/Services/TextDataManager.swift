protocol IDataTextManager {
    func getLicenseText() -> TextModel
}

class TextDataManager: IDataTextManager {
    func getLicenseText() -> TextModel {
        return TextModel(
            title: LicenseText.title,
            body: LicenseText.titleText
        )
    }
}

