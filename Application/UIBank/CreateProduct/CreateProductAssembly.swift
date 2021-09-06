
import EasyDi


class CreateProductAssembly: Assembly {
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    private lazy var bank: BankAssembly = context.assembly()
    
    func presenter(user: User, view: ProductView, viewController: UIViewController) -> CreateProductPresenter {
        define(init: CreateProductPresenterImpl()) {
            $0.view = view
            $0.user = user
            $0.bank = self.bank.bank
            $0.userRouter = self.userRouter.userRouter(view: viewController)
            return $0
        }
    }
    
    
    func viewController(user: User) -> UIViewController {
        define(init:CreateProductViewController()) {
            $0.presenter = self.presenter(user: user, view: $0, viewController: $0)
            return $0
        }
    }
    
}


//func viewController(user: User, product: Product) -> UIViewController {
//
//    define(init: ViewControllersFactory().viewController(identifier: "ProductDetailsViewController") as ProductDetailsViewController) {
//        $0.presenter = self.presenter(user: user, product: product, view: $0, viewController: $0)
//        return $0
//    }
//}
