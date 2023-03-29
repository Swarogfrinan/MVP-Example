//
//  DetailViewController.swift
//  MVP Example
//
//  Created by Ilya Vasilev on 28.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter : DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    @IBAction func tapActionButtonPressed(_ sender: UIButton) {
        presenter.tap()
    }
}
 
extension DetailViewController : DetailViewProtocol {
    func setComment(comment: Comment?) {
        self.commentLabel.text = comment?.name
    }
    
    
}
