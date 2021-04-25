/*
Address {country, city, ...}
User { id, name, secondName, lastName, email, phone, address }
 
Credit {percent, value}
Deposit {percent, value}
enum Type { deposit(Deposit), credit(Credit) }
Product { id, title, type  }
 
Bank {
 name
 func createClient(name, secondName, lastName, email, phone, address) -> User
 func createDepositProduct(user: User) -> Product
 func createCreditProduct(user: User) -> Product
 func products(user: User) -> [Product]
}
 
как хранить продукты юзера внутри банка? (можем ли хранить инфу о продуктах в Storage?)
[String: [Product]] - ключ айди юзера, значение - массив продуктов
*/
import Foundation

struct Address: Codable {
    let country: String
    let city: String
    let street: String
    let house: String
    let flat: Int
    let floor: Int
}

struct Phone: Codable {
    let countryCode: Int
    let numberPhone: Int
}

struct User: Codable {
    let id: String
    let name: String
    let secondName: String
    let lastName: String
    let email: String
    let phone: Phone
    let address: Address
}
protocol Storage {
    func set(data: Data, key: String)
    func getData(key: String) -> Data?
}

class UserDef: Storage { //
    var user = UserDefaults.standard
    
    func set(data: Data, key: String) {
        user.set(data, forKey: key)
    }
    func getData(key: String) -> Data? {
        return user.data(forKey: key)
    }
}

//File manager
class FileManag: Storage {
    var val = FileManager.default
    
    func set(data: Data, key: String) {
        val.createFile(atPath: key, contents: data)
    }
    func getData(key: String) -> Data? {
        return val.contents(atPath: key)
        
    }
}

// Dictionary - InMemoryStorage
class InMemoryStorage: Storage {
    var dictionary: [String: Data] = [:]

    func set(data: Data, key: String) {
        dictionary[key] = data
    }
    
    func getData(key: String) -> Data? {
        return dictionary[key]
    }
}

class StoragesAssembly {
    var inMemory: Storage {
        return InMemoryStorage()
    }
    
    var userDefaults: Storage {
        return UserDef()
    }
    
    var filesystemStorage: Storage {
        return FileManag()
    }
}


let assembly = StoragesAssembly()
let storage = assembly.userDefaults

let address1 = Address(country: "Russia", city: "Moscow", street: "Institutskaya", house: "kkkk", flat: 300, floor: 4)
let phone1 = Phone(countryCode: 495, numberPhone: 0999999)
let user1 = User(id: "gggg", name: "Ivan", secondName: "I", lastName: "Ivanov", email: "ivanov@mail.ru", phone: phone1, address: address1)
do {
    let data = try JSONEncoder().encode(user1)
    
    storage.set(data: data, key: "test_key")

    if let data = storage.getData(key: "test_key") {
        let str = String(data: data, encoding: .utf8)
        print(str)
    }
} catch { print(error) }





