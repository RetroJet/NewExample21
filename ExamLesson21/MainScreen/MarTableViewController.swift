import UIKit

class MarTableViewController: UITableViewController {
    var imageDataManager: IDataManager!
    
    private let identifier = "raccon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.separatorStyle = .none
        tableView.register(ImageDescriptionCell.self, forCellReuseIdentifier: identifier)
        
    }
    
    //MARK: -> UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: -> UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageDataManager.getMarkedImages().count
    }
    
    //MARK: -> UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath) as? ImageDescriptionCell else {
            return UITableViewCell()
        }
        
        let image = imageDataManager.getMarkedImages()[indexPath.row]
        
        cell.configure(data: image)
        cell.actionButton = { tappedCell in
            if let index = tableView.indexPath(for: tappedCell) {
                self.imageDataManager.toggleCheckMarker(image)
                tableView.deleteRows(at: [index], with: .automatic)
            }
        }
        
        return cell
    }
}

//MARK: -> Setup TableViews
private extension MarTableViewController {
    func setup() {
        setupBackgroundColor()
    }
    
    func setupBackgroundColor() {
        tableView.backgroundColor = .darkGray
    }
}
