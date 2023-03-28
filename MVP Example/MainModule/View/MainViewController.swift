
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var presenter : MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
//        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = comment?.name
        content.textProperties.color = .black
        cell.contentConfiguration = content
        return cell
    }
}

extension MainViewController :  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print([indexPath.row].description)
    }
}

extension MainViewController : MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    

    
    
}

