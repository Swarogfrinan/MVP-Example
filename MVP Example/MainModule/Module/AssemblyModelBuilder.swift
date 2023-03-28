import Foundation
import UIKit

protocol AsselderBuilderProtocol {
    func createMainModel(router: RouterProtocol) -> UIViewController
    func createDetailModel(comment: Comment?, router : RouterProtocol) -> UIViewController
}

class AssemblyBuilder: AsselderBuilderProtocol {
    
    func createMainModel(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModel(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
    
}
