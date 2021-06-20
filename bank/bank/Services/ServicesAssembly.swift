import Foundation

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


// абстракция
// реализация
// добавить в ассембли

