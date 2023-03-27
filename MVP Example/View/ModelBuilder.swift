import Foundation
import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMain() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
