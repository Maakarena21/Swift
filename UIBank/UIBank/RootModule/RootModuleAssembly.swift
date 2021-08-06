//
//  RootModuleAssembly.swift
//  UIBank
//
//  Created by Silence on 25.07.2021.
//

import EasyDi

class RootModuleAssembly: Assembly {
    private lazy var bankAssembly: BankAssembly = context.assembly()
    
    
    
    private lazy var servicesAssembly: Services1Assembly = context.assembly()
    var viewController: ViewController {
        define(init: ViewControllersFactory().viewController(identifier: "ViewController") as ViewController) {
            $0.bank = self.bankAssembly.bank
            $0.userRouter = self.router(viewController: $0)
            return $0
        }
    }
}

extension RootModuleAssembly {
    func router(viewController: UIViewController) -> UserRouter {
        define(init: UserRouterImpl()) {
            $0.viewController = viewController
            return $0
        }
    }
}

