

//import EasyDi
//
//class SenderMoneyPresenterAssembly: Assembly {
//    private lazy var bank: BankAssembly = context.assembly()
//    private lazy var userRouter: UserRouterAssembly = context.assembly()
//    private lazy var services: ServicesAssembly = context.assembly()
//
//
//    func presenter(view: SenderMoneyPresenterView, viewController: UIViewController) -> MoneySenderPresenterImpl {
//        define(init: MoneySenderPresenterImpl()) {
//            $0.bank = self.bank.bank
//            $0.view = view
//            $0.services = self.services
//            return $0
//
//        }
//    }
//}
