
import EasyDi

class UserListAssembly: Assembly {
    private lazy var bank: BankAssembly = context.assembly()
    private lazy var rootModuleAssembly: RootModuleAssembly = context.assembly()
    

    
    
   private func presenter(view: UserListView, viewController: UIViewController) -> UserListPresenter {
        define(init: UserListPresenterImpl()) {
            $0.bank = self.bank.bank
            $0.view = view
            $0.userRouter = self.rootModuleAssembly.router(viewController: viewController)
            return $0

        }
    }
    
    func viewController() -> UserListViewController {
        define(init: UserListViewController()) {
            $0.bank = self.bank.bank
            $0.userRouter = self.rootModuleAssembly.router(viewController: $0)
            $0.presenter = self.presenter(view: $0, viewController: $0)
            return $0
        }
    }
}
