
import EasyDi

class UserRouterAssembly: Assembly {
    func userRouter(view: UIViewController) -> UserRouter {
        define(init: UserRouterImpl()) {
            $0.viewController = view
            return $0
        }
    }
}
