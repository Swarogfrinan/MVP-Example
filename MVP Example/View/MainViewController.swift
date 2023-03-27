
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var greetingsLabel : UILabel!
    var presenter : MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
    }
}

extension MainViewController : MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingsLabel.text = greeting
    }
    
    
}

