import XCTest
@testable import  MVP_Example

class MockNavigationController : UINavigationController {
    var presentedVC = UIViewController()
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {
    
    var router : RouterProtocol!
    var mockNavigationController = MockNavigationController()
    var assemblyBuilder = AssemblyBuilder()
    
    func testsetUpWithError() throws {
        var navigationController : UINavigationController?
        if let navigationController = navigationController {
            let mainController = assemblyBuilder.createMainModel(router: router)
            navigationController.viewControllers = [mainController]
        }
    }
    
    func testShowDetail(comment: Comment?) {
        var navigationController : UINavigationController?
        
        if let navigationController = navigationController {
           let detailViewController = assemblyBuilder.createDetailModel(comment: comment, router: router)
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func testPopToRoot() {
        var navigationController : UINavigationController?
        
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    override func setUp() {
        router = Router(navigationController: mockNavigationController, assemblyBuilder: assemblyBuilder)
    }
    override func tearDown() {
        router = nil
    }
    func testRouter() {
        router.showDetail(comment: nil)
        let detailController = mockNavigationController.presentedVC
        XCTAssertTrue(detailController is DetailViewController)
    }
}
