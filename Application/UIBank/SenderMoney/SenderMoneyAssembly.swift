
import EasyDi

class SenderMoneyAssembly: Assembly {
    private lazy var services: ServicesAssembly = context.assembly()
    private lazy var userRouter: UserRouterAssembly = context.assembly()
    private lazy var bank: BankAssembly = context.assembly()
    func presenter(view: SenderMoneyPresenterView) -> MoneySenderPresenter {
        define(init: MoneySenderPresenterImpl()) {
            $0.moneyService = self.services.moneyService
            $0.fastPaymentService = self.services.fastPaymentsService
            $0.bank = self.bank.bank
            $0.rateService = self.services.rateService
            $0.view = view
            return $0
            
        }
    }
    var viewController: UIViewController {
        define(init: SenderMoneyViewController()) {
            $0.presenter = self.presenter(view: $0)
            return $0
        }
    }
}
