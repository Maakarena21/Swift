

import EasyDi


class ProductDetailsAssembly: Assembly {
    private lazy var bank: BankAssembly = context.assembly()
    private lazy var services: ServicesAssembly = context.assembly()
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    
    private func presenter(user: User, product: Product, view: ProductDetailsView, viewController: UIViewController) -> ProductDetailsPresenter {
        define(init: ProductDetailsPresenterImpl()) {
            $0.product = product
            $0.user = user
            $0.moneyService = self.services.moneyService
            $0.fastPayments = self.services.fastPaymentsService
            $0.bank = self.bank.bank
            $0.view = view
            $0.userRouter = self.userRouter.userRouter(view: viewController)
            
            return $0
        }
    }
    
    func viewController(user: User, product: Product) -> UIViewController {
        
        define(init: ProductDetailsViewController()) {
            $0.presenter = self.presenter(user: user, product: product, view: $0, viewController: $0)
            return $0
        }
    }
}

