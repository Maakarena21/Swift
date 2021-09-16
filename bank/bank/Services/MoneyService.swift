import Foundation

enum MoneyServiceError: Error {
    case productNotFound
}

enum MoneySenderError: Error {
    case userNotFound
    case insuffisentFunds
}

enum MoneyRecieverError: Error {
    case userNotFound
    case noValidProducts
}

protocol MoneyReciever {
    func recieve(summ: Float, phone: Phone) throws
}

protocol MoneySender {
    func send(from: Phone, summ: Float) throws
    func printProduct(phone: Phone) throws
}


typealias MoneyService = MoneySender & MoneyReciever


class MoneyServiceImpl: MoneyService {
    
    
  
    var preferencesService: PreferencesService
    var userStorage: UserStorage
    var productStorage: ProductStorage
    var productService: ProductService
    
    init(userStorage: UserStorage,
         productStorage: ProductStorage,
         productService: ProductService,
         preferencesService: PreferencesService) {
        self.userStorage = userStorage
        self.productStorage = productStorage
        self.productService = productService
        self.preferencesService = preferencesService
    }
    
    func send(from phone: Phone, summ: Float) throws {
        let user = try userStorage.search(phone: phone)
        let productArray = productStorage.get(user: user)
        let preferences = preferencesService.getPreferences(user: user)
        guard let productId = preferences?.productSenderId ?? productArray.first?.id else {
            throw MoneyServiceError.productNotFound
        }
        if let product = productArray.first(where: {$0.id == productId} ) {
            
           let productMoneySend = try productService.remove(money: summ, product: product)
            productStorage.add(user: user, product: productMoneySend)
        } else {
            throw MoneyServiceError.productNotFound
        }
    }
    
    func recieve(summ: Float, phone: Phone) throws {
        let user = try userStorage.search(phone: phone)
        let productArray = productStorage.get(user: user)
        let preferences = preferencesService.getPreferences(user: user)
        guard let productId = preferences?.productReceiverId ?? productArray.first?.id else {
            throw MoneyServiceError.productNotFound
        }
        if let product = productArray.first(where: {$0.id == productId} ) {
            
           let productMoneySend = try productService.add(money: summ, product: product)
            productStorage.add(user: user, product: productMoneySend)
        } else {
            throw MoneyServiceError.productNotFound
        }
    }
    
    func printProduct(phone: Phone) throws {
        let user = try userStorage.search(phone: phone)
        let products = productStorage.get(user: user)
        print(products)
    }
    
}






