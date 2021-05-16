import Foundation

class StoragesAssembly {
    
    var inMemory: Storage {
//        if (true/*sonme condition* - test enviroment, locale changed e.t.c*/) {
//            return TestStorage()
//        } else {
            return InMemoryStorage()
        }
//    }
    var userDefaults: Storage {
//        if (true/*sonme condition* - test enviroment, locale changed e.t.c*/) {
//            return TestStorage()
//        } else {
            return UserDef()
        }
//    }
    
    var filesystemStorage: Storage {
//        if (true/*sonme condition* - test enviroment, locale changed e.t.c*/) {
//            return TestStorage()
//        } else {
            return FileManag()
        }
    
    var userStorage: UserStorage {
        return UserStorageImpl(storage: userDefaults)
    }
    
    var productStorage: ProductStorage {
        return ProductStorageImpl(storage: userDefaults)
    }
}
//}

//class TestStorage: Storage {
//
//    var dictionary: [String: Data] = [:]
//
//    func set(data: Data, key: String) {
//        dictionary[key] = data
//    }
//
//    func get(key: String) -> Data? {
//        return dictionary[key]
//    }
//}

