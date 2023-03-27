
import Foundation
protocol MainViewProtocol {
    func setGreeting(greeting : String)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, person : Person)
    func showGreeting()
}

class MainPresenter : MainViewPresenterProtocol {
    let view : MainViewProtocol
    let model : Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.model = person
    }
    
    func showGreeting() {
        let greeting = model.firstName + "" + model.lastName
        self.view.setGreeting(greeting: greeting)
    }
}

