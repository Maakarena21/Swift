import Foundation
import EasyDi

class ServicesAssembly: Assembly {
    private lazy var storagesAssembly: StoragesAssembly = context.assembly()
    var preferencesService: PreferencesService {
        define(init: PreferencesServiceImpl()) {
            $0.storage = self.storagesAssembly.inMemory
            return $0
        }
    }
   
    var fastPaymentsService: FastPaymentsService {
        define(init: FastPaymentsServiceImpl()) {
            $0.moneyService = self.moneyService
            return $0
        }
    }
    
    var productService: ProductService {
        return define(init: ProductServiceImpl())
    }
    var moneyService: MoneyService {
        return define(init: MoneyServiceImpl(userStorage: self.storagesAssembly.userStorage, productStorage: self.storagesAssembly.productStorage , productService: self.productService ,preferencesService: self.preferencesService))
    }
}

//ServicesAssemblyTwo.instance() // будем заводить ассембли


// абстракция
// реализация
// добавить в ассембли
