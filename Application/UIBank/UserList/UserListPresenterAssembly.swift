
//import EasyDi
//
//class UserListPresenterAssembly: Assembly {
//    private lazy var bank: BankAssembly = context.assembly()
//    private lazy var userRouter: UserRouterAssembly = context.assembly()
//    
//    
//    func userListPresenterAssembly(viewController: UIViewController) -> UserListPresenter {
//        define(init: UserListPresenterImpl()) {
//            $0.bank = self.bank.bank
//            $0.userRouter = self.userRouter.userRouter(view: viewController)
//            return $0
//
//        }
//    }
//}
