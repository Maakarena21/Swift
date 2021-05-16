import Foundation

class BankAssembly {
    
    let storagesAssembly = StoragesAssembly()
    
    var bank: Bank {
        return BankImpl(storage: storagesAssembly.userStorage, productStorage: storagesAssembly.productStorage)
    }
//
//    var inMemoryBank: Bank {
//        return BankImpl(storage: storagesAssembly.inMemory)
//    }
//
//    func bank(with storage: Storage) -> Bank {
//        return BankImpl(storage: storage)
//    }
}


