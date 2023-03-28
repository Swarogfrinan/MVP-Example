import Foundation


protocol MainViewProtocol {
    func succes()
    func failure(error : Error)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, networkService : NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments : [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter : MainViewPresenterProtocol {
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    var comments: [Comment]?
    var view : MainViewProtocol?
    let networkService : NetworkServiceProtocol!
    let router : RouterProtocol?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
   
    
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    
    
}

