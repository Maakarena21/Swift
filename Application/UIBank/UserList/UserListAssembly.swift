
import EasyDi

class UserListAssembly: Assembly {
    private lazy var bankAssembly: BankAssembly = context.assembly()
    private lazy var rootModuleAssembly: RootModuleAssembly = context.assembly()
    var viewController: UIViewController {
        define(init: UserListViewController()) {
            $0.bank = self.bankAssembly.bank
            $0.userRouter = self.rootModuleAssembly.router(viewController: $0)
            return $0
        }
    }
}
