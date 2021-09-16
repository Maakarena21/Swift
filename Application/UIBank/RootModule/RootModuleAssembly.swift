import EasyDi

class RootModuleAssembly: Assembly {
    private lazy var bank: BankAssembly = context.assembly()
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    
    
    
    func presenter(view: RegisterView, viewController: UIViewController) -> RegisterPresenter {
        define(init: RegisterPresenterImpl()) {
            $0.bank = self.bank.bank
            $0.registerView = view
            $0.userRouter = self.userRouter.userRouter(view: viewController)
            return $0

        }
    }
    
    var viewController: ViewController {
        define(init: ViewController()) {
            $0.presenter = self.presenter(view: $0, viewController: $0)
            return $0
        }
    }
}
extension RootModuleAssembly {
    func router(viewController: UIViewController) -> UserRouter {
        define(init: UserRouterImpl()) {
            $0.viewController = viewController
            return $0
        }
    }
}

