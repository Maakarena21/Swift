import UIKit

protocol UserRouter {
    func userDetails(user: User)
    func usersList()
    func moneySender()
}

class UserRouterImpl: UserRouter {
    weak var viewController: UIViewController?
    
    
    func userDetails(user: User) {
        let vc = UserDetailsAssembly.instance().viewController(user: user)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func usersList() {
        let vc = UserListAssembly.instance().viewController
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func moneySender() {
        let vc = SenderMoneyAssembly.instance().viewController
        viewController?.present(vc, animated: true, completion: nil)
    }
}
