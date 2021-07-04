import Foundation
import EasyDi

class ServicesAssembly {
    private let storageAssembly = StoragesAssembly()
    var productService: ProductService {
        return ProductServiceImpl()
    }
    
    var fastPaymentService: FastPaymentsService {
        let fastPaymentsService = FastPaymentsServiceImpl()
        fastPaymentsService.moneyService = moneyService
        return fastPaymentsService
    }
    var preferencesService: PreferencesService {
        let preferencesService = PreferencesServiceImpl()
        preferencesService.storage = storageAssembly.inMemory
        return preferencesService
    }
    var moneyService: MoneyService {
        return MoneyServiceImpl(userStorage: storageAssembly.userStorage, productStorage: storageAssembly.productStorage, productService: productService, preferencesService: preferencesService)
    }
}

class ServicesAssemblyTwo: Assembly {
    private lazy var storageAssembly: StoragesAssemblyTwo = context.assembly()
    var preferencesService: PreferencesService {
        define(init: PreferencesServiceImpl()) {
            $0.storage = self.storageAssembly.inMemory
            return $0
        }
    }
}

ServicesAssemblyTwo.instance() // будем заводить ассембли


// абстракция
// реализация
// добавить в ассембли
