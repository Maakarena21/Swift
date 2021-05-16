import Foundation

protocol Storage {
    func set(data: Data, key: String)
    func get(key: String) -> Data?
}

class UserDef: Storage {
    
    var user = UserDefaults.standard
    
    func set(data: Data, key: String) {
        return user.setValue(data, forKey: key)
    }
    
    func get(key: String) -> Data? {
        return user.data(forKey: key)
    }
}

extension Storage {
    func remove(key: String) {}
}

extension UserDef {
    func remove(key: String) {
        user.removeObject(forKey: key)
    }
}

class FileManag: Storage {
    
    var filemanager = FileManager.default
    
    func set(data: Data, key: String) {
        filemanager.createFile(atPath: key, contents: data)
    }
    
    func get(key: String) -> Data? {
        return filemanager.contents(atPath: key)
    }
}

class InMemoryStorage: Storage {
    
    var dictionary: [String: Data] = [:]
    func set(data: Data, key: String) {
        guard dictionary[key] == nil else {
            print("trying to overwrite extisting value - it's an error")
            return
        }
        
        dictionary[key] = data
    }
    func get(key: String) -> Data? {
        return dictionary[key]
    }
}
