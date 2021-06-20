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
<<<<<<< HEAD

=======
>>>>>>> 4cb4a35c1ef63d07e22498b9d2e079b1e0a84295
