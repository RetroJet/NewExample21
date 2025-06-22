import UIKit

class ImageListViewController: UIViewController {
    var imageDataManager: IDataManager!
    
    private let tableView = UITableView()
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK: -> UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete") { _, _, completion in
                self.imageDataManager.removeImage(index: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                completion(true)
            }
        
        let markAction = UIContextualAction(
            style: .destructive,
            title: "Mark") { _, _, completion in
                self.imageDataManager.toggleMark(index: indexPath.row)
                
                tableView.reloadRows(at: [indexPath], with: .automatic)
                
                completion(true)
            }
        
        deleteAction.backgroundColor = .systemRed
        markAction.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction, markAction])
    }
}

//MARK: -> UITableDataSource
extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageDataManager.getAllImages().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let image = imageDataManager.getAllImages()[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = image.imageName
        configuration.image = UIImage(named: image.imageName)
        configuration.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        
        cell.accessoryType = image.isMark ? .checkmark : .none
        cell.contentConfiguration = configuration
        
        return cell
    }
}

//MARK: -> Setup View
private extension ImageListViewController {
    func setup() {
        setupBackground()
        addSubview()
        setupTableView()
        setupLayout()
    }
    
    func setupBackground() {
        view.backgroundColor = .white
    }
    
    func addSubview() {
        view.addSubviews(
            tableView
        )
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: -> Auto Layout
private extension ImageListViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
