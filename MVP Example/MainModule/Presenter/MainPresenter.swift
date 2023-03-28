import Foundation


protocol MainViewProtocol {
    func succes()
    func failure(error : Error)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, networkService : NetworkService)
    func getComments()
    var comments : [Comment]? { get set }
    
}

class MainPresenter : MainViewPresenterProtocol {
    
    var comments: [Comment]?
     var view : MainViewProtocol?
    let networkService : NetworkService!
    
    required init(view: MainViewProtocol, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
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

