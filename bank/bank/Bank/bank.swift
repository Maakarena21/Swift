import Foundation

protocol Bank {
    func createClient(name: String,
                      secondName: String,
                      lastName: String,
                      email: String,
                      phone: Phone,
                      address: Address) -> User
    func createDepositProduct(user: User) -> Product
    func createCreditProduct(user: User) -> Product
}

class BankImpl {
    
//    let storage: Storage // зависимость
    let userStorage: UserStorage
    let productStorage: ProductStorage
    
    init(
        storage: UserStorage,
        productStorage: ProductStorage
        ) { // инъекция зависимости
        userStorage = storage
        self.productStorage = productStorage
    }
}

extension BankImpl: Bank {
    func createClient(name: String, secondName: String, lastName: String, email: String, phone: Phone, address: Address) -> User {
        let user = User(id: UUID().uuidString,
                        name: name,
                        secondName: secondName,
                        lastName: lastName,
                        email: email,
                        phone: phone,
                        address: address)
            
        userStorage.add(user: user)

        return user
    }
    
    func createDepositProduct(user: User) -> Product {
        let product = Product(id: UUID().uuidString,
                              name: "Разделяй и зарабатывай!",
                              type: .deposit(Deposit(percent: 12, summ: 0, type: .month)))
        
        productStorage.addProduct(user: user, product: product)
        
        return product
    }
    
    func createCreditProduct(user: User) -> Product {
        let product = Product(id: UUID().uuidString,
                              name: "Бери щас плати всю жизнь!",
                              type: .credit(Credit(summ: 15_000, months: 12, percentYear: 720)))
        
        productStorage.addProduct(user: user, product: product)
        
        return product
    }
    
}

//extension Bank {
//
//    func store(client: User) {}
//
//    func store(product: Product, user: User) {}
//
//}

//extension BankImpl {
//
//    /*если надоело гонять JSONEncoder/JSONDecoder - можете прочитать про Generic и Generic constraint. Либо сделать абстракцию -= UserStorage,
//
//     {getUsers() -> [Users], setUsers(_users: [Users])}, в него надо инжектнуть Storage*/
//
//    func store(client: User) {
//
//        guard let userData = storage.get(key: "clients") else { return }
//
//        do {
//            var userArray = try JSONDecoder().decode([User].self, from: userData)
//
//                for i in userArray {
//                if client.id != i.id {
//                    userArray.append(client)
//                }
//            }
//
//            let userArrayData = try JSONEncoder().encode(userArray)
//            storage.set(data: userArrayData, key: "clients")
//
//        } catch {
//
//            print("Error - \(error)")
//
//        }
        
        
        
        /* клиентов храним в массиве:
         
         - читаем Data из словаря по ключу "clients"
         - JSONDecoder() -> [User] (тип [User].self)
         - аппендим в массив User, проверив предвраительно, что юзера с таким айдишником в массиве нет
         - и если юзера нет - то аппендим в массив,
         - JSONEncoder() -> Data -> storage.set(data:key)
         */
//    }
//
//    func store(product: Product, user: User) {
//
//        guard let productData = storage.get(key: "products_of_user_\(user.id)") else {
//            return
//        }
//
//        var arrayProduct = try! JSONDecoder().decode([Product].self, from: productData)
//
//        for i in arrayProduct {
//            if product.id != i.id {
//                arrayProduct.append(product)
//            }
//        }
//
//        let arrayProductData = try! JSONEncoder().encode(arrayProduct)
//
//        storage.set(data: arrayProductData, key: "products_of_user_\(user.id)")
//
//
//        /*
//          - ключ формируется: "products_of_user_\(user.id)"
//         - достаем массив продуктов -> JSONDecoder() -> [Product] (тип [Product].self)
//         - проверям, что в массиве нету продукта с указанным идентификатором
//         - аппендим в массив
//         - JSONEncoder() -> Data -> storage.set(data:key)
//         */
//    }
//}

protocol UserStorage {
    
    func users() -> [User]
    func add(user: User)
    
}

class UserStorageImpl: UserStorage {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func users() -> [User] {
        
        guard let usersData = storage.get(key: "clients") else {
            return []
        }
        
        do {
            let users = try JSONDecoder().decode([User].self, from: usersData)
            
            return users
            
        } catch {
            
            print("JSONDecoder error \(error)")
            
            return []
        }
    }
    
    func add(user: User) {
        guard let usersData = storage.get(key: "clients") else {
            let array = [user]
            
            do {
                let arrayData = try JSONEncoder().encode(array)
                storage.set(data: arrayData, key: "clients")
            } catch {
                print("JSONEncoder error \(error)")
            }
            return
        }
        
        do {
            var users = try JSONDecoder().decode([User].self, from: usersData)
            
            // убедиться, что юзера нету в этом массиве по идентификатору user.id
            
            for i in users {
                if user.id != i.id {
                    users.append(user)
                }
            }
            
            let usersData = try JSONEncoder().encode(users)
            storage.set(data: usersData, key: "clients")
            
        } catch {
            print("JSONDecoder error \(error)")
        }
    }
}


protocol ProductStorage {
    
    func addProduct(user: User, product: Product)
    
}

class ProductStorageImpl: ProductStorage {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func addProduct(user: User, product: Product) {
        
        guard let productData = storage.get(key: "products_of_user_\(user.id)") else {
            let array = [product]
            
            do {
                let arrayData = try JSONEncoder().encode(array)
                storage.set(data: arrayData, key: "products_of_user_\(user.id)")
            } catch {
                print("JSONEncoder error \(error)")
            }
            
            return
        }
        
        do {
            var productArray = try JSONDecoder().decode([Product].self, from: productData)
            for i in productArray {
                if i.id != product.id {
                    productArray.append(product)
                }
            
            }
        }
        catch {
            print("JSONDecoder error \(error)")
        }
    }
}


/*
 
 Реализовать переводы из банка в банк по номеру телефона
 
 */

protocol MoneyReciever {
    func recieve(summ: Float, phone: Phone) -> Bool
}

protocol MoneySender {
    func send(summ: Float, phone: Phone) -> Bool
}

// в банк инжектим MoneySender
// сам банк реализует MoneyReciever

class FastPaymentsService: MoneySender {
    var recievers = [MoneyReciever]()
    
    func send(summ: Float, phone: Phone) -> Bool {
        var isSent = false
        
        recievers.forEach {
            if $0.recieve(summ: summ, phone: phone) {
                isSent = true
                return
            }
        }
        
        return isSent
    }
    
    func register(reciever: MoneyReciever) {
        recievers.append(reciever)
    }
}


/*
let bank1 = BankAssembly().bank
let bank2 = BankAssembly().bank

bank1.send(summ: 123, phone: Phone(countryCode: 7, numberPhone: 3234324234))

*/

