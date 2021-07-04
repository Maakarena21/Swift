import EasyDi
import Foundation

class StoragesAssembly {
    
    
    var inMemory: Storage {
        return InMemoryStorage.shared
        }

    var userDefaults: Storage {
            return UserDef()
        }
    
    var filesystemStorage: Storage {
            return FileManag()
        }
    
    var userStorage: UserStorage {
        return UserStorageImpl(storage: inMemory)
    }
    
    var productStorage: ProductStorage {
        return ProductStorageImpl(storage: inMemory)
    }
}

class StoragesAssemblyTwo: Assembly {
    var inMemory: Storage {
        return define(scope: .lazySingleton, init: InMemoryStorage()) 
    }
}
