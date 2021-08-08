
import EasyDi

class SenderMoneyAssembly: Assembly {
    private lazy var services: ServicesAssembly = context.assembly()
    private lazy var bank: BankAssembly = context.assembly()
    
    
    var viewController: UIViewController {
        define(init: ViewControllersFactory().viewController(identifier: "SenderMoneyViewController") as SenderMoneyViewController) {
            $0.bank = self.bank.bank
            $0.services = self.services
            return $0
        }
    }
}
