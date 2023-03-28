//
//  MainPresenterTest.swift
//  MVP ExampleTests
//
//  Created by Ilya Vasilev on 27.03.2023.
//
import XCTest
@testable import MVP_Example

class MockView : MainViewProtocol {
    func succes() {
        
    }
    
    func failure(error: Error) {
        
    }
}

class MockNetworkService : NetworkServiceProtocol {
    
    var comments : [Comment]!
    
    init() {}
    
    convenience init(comments : [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[MVP_Example.Comment]?, Error>) -> Void) {
        if let comments = comments {
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view : MockView!
    var presenter : MainPresenter!
    var networkService : NetworkServiceProtocol!
    var comments = [Comment]()
    var router : RouterProtocol!
    
    override func setUpWithError() throws {
        view = MockView()
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyBuilder()
router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        
    }
    
    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }
    
    func testGetSucces() {
        let comment = Comment(postId: 1, id: 2, name: "Bar", email: "Baz", body: "Foo")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        var catchComments : [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchComments?.count,  0)
        XCTAssertEqual(catchComments?.count,  comments.count)
    }
}
