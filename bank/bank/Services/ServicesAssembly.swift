import Foundation

class ServicesAssembly {
    private let storageAssembly = StoragesAssembly()
    var productService: ProductService {
        return ProductServiceImpl()
    }
    
    var fastPaymentService: FastPaymentsService {
        return FastPaymentsService()
    }
    var preferencesAssembly: PreferencesService {
        let preferencesService = PreferencesServiceImpl()
        preferencesService.storage = storageAssembly.inMemory
        return preferencesService
    }
}

