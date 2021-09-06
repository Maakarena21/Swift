
import EasyDi


class ProductDetailsPresenterAssembly: Assembly {
    private lazy var services: ServicesAssembly = context.assembly()
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    
    func presenter(viewController: UIViewController) -> ProductDetailsPresenterImpl {
        define(init: ProductDetailsPresenterImpl()) {
            $0.money = self.services.moneyService
            $0.fastPayments = self.services.fastPaymentsService
            return $0
        }
    }
}
