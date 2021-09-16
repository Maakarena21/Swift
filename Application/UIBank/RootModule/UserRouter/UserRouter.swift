import UIKit

protocol UserRouter {
    func userDetails(user: User)
    func usersList()
    func moneySender()
    func createProduct(user: User, result: @escaping (Product) -> () )
    func productDetails(user: User, product: Product)
    func dissmiss()
}

class UserRouterImpl: UserRouter {
    weak var viewController: UIViewController?
    
    
    func productDetails(user: User, product: Product) {
        let vc = ProductDetailsAssembly.instance().viewController(user: user, product: product)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func createProduct(user: User, result: @escaping (Product) -> ()) {
        let vc = CreateProductAssembly.instance().viewController(user: user, result: result)
        viewController?.present(vc, animated: true, completion: nil)
    }
    func usersList() {
        let vc = UserListAssembly.instance().viewController
        viewController?.present(vc(), animated: true, completion: nil)
    }
    
    func userDetails(user: User) {
        let vc = UserDetailsAssembly.instance().viewController(user: user)
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func moneySender() {
        let vc = SenderMoneyAssembly.instance().viewController
        viewController?.present(vc, animated: true, completion: nil)
    }
    
    func dissmiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
