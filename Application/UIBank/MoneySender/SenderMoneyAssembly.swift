
import EasyDi

class SenderMoneyAssembly: Assembly {
    private lazy var services: ServicesAssembly = context.assembly()
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    private lazy var bank: BankAssembly = context.assembly()
    func presenter(viewController: SenderMoneyPresenterView) -> MoneySenderPresenter {
        define(init: MoneySenderPresenterImpl()) {
            $0.moneyService = self.services.moneyService
            $0.fastPaymentsService = self.services.fastPaymentsService
            $0.bank = self.bank.bank
            $0.senderMoneyPresenterView = viewController
            return $0
            
        }
    }
    var viewController: UIViewController {
        define(init: SenderMoneyViewController()) {
            $0.presenter = self.presenter(viewController: $0)
            return $0
        }
    }
}
