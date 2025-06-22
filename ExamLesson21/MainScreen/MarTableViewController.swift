import UIKit

class MarTableViewController: UITableViewController {
    var imageDataManager: IDataManager!
    
    private let identifier = "raccon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ImageCell.self, forCellReuseIdentifier: identifier)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageDataManager.getMarkedImages().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath) as? ImageCell else {
            return UITableViewCell()
        }
        
        let image = imageDataManager.getMarkedImages()[indexPath.row]
        
        cell.configure(data: image)
        
        return cell
    }
}
