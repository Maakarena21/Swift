import EasyDi

class UserDetailsAssembly: Assembly {
    
    private lazy var bankAssembly: BankAssembly = context.assembly()
    func viewController(user: User) -> UIViewController {
        define(init: ViewControllersFactory().viewController(identifier: "UserDetailsViewController") as UserDetailsViewController) {
            $0.user = user
            $0.bank = self.bankAssembly.bank
            return $0
    }
  }
}
