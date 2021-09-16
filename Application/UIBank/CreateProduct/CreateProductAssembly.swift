
import EasyDi


class CreateProductAssembly: Assembly {
    private lazy var router: UserRouterAssembly = context.assembly()
    private lazy var bank: BankAssembly = context.assembly()
    
    func presenter(user: User, view: ProductView, viewController: UIViewController, result:  @escaping (Product) -> ()) -> CreateProductPresenter {
        define(init: CreateProductPresenterImpl()) {
            $0.result = result
            $0.view = view
            $0.user = user
            $0.bank = self.bank.bank
            $0.router = self.router.userRouter(view: viewController)
            return $0
        }
    }
    
    
    func viewController(user: User, result: @escaping (Product) -> ()) -> UIViewController {
        define(init:CreateProductViewController()) {
            $0.presenter = self.presenter(user: user, view: $0, viewController: $0, result: result)
            return $0
        }
    }
    
}
