//
//  MainPresenterTest.swift
//  MVP ExampleTests
//
//  Created by Ilya Vasilev on 27.03.2023.
//
import XCTest
@testable import MVP_Example

class MockView : MainViewProtocol {
    var titleTest : String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view : MockView!
    var person : Person!
    var presenter : MainPresenter!
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "CocoJaz")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil() {
    XCTAssertNotNil(view, "view is not nill")
        XCTAssertNotNil(person, "person is not nill")
        XCTAssertNotNil(presenter, "presenter is not nill")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "BazCocoJaz")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "CocoJaz")
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
