import EasyDi

class UserDetailsAssembly: Assembly {
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    private lazy var bankAssembly: BankAssembly = context.assembly()
    private lazy var assembly: CreateProductAssembly = context.assembly()
    func viewController(user: User) -> UIViewController {
        define(init: UserDetailsViewController()) {
            $0.presenter = self.presenter(user: user, view: $0, viewController: $0)
            return $0
    }
  }
    func presenter(user: User, view: UserDetailsView, viewController: UIViewController) -> UserDetailsPresenter {
        define(init: UserDetailsPresenterImpl()) {
            $0.assembly = self.assembly
            $0.view = view
            $0.user = user
            $0.products = self.bankAssembly.bank.allProducts(user: user)
            $0.bank = self.bankAssembly.bank
            $0.userRouter = self.userRouter.userRouter(view: viewController)
            return $0
        }
        
    }
    
}
