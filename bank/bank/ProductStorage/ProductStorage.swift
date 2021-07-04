
import Foundation


protocol ProductStorage {
    
    func get(user: User) -> [Product]
    func add(user: User, product: Product)
}

class ProductStorageImpl: ProductStorage {
    
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func get(user: User) -> [Product]  {
        do {
            let products: [Product] = try storage.value(key: "products_of_user_\(user.id)")
            return products
        } catch {
            return []
        }
    }
    func add(user: User, product: Product) {
        var products = get(user: user)
        if products.isEmpty {
            do {
                try storage.set(value: [product], key: "products_of_user_\(user.id)")
            } catch {
                print("Error saving product")
            }
        } else {
            if let productIndex = products.firstIndex(where: { $0.id == product.id }) {
                products[productIndex] = product
            } else {
                products.append(product)
            }
            do {
                try storage.set(value: products, key: "products_of_user_\(user.id)")
            } catch {
                print("Error saving product")
            }
        }
    }
}




        
        
        
        
        
        
        
        
        
        
        
//        let productData = storage.get(key: "products_of_user_\(user.id)") else {
//            return []
//        }
//        do {
//            let products = try JSONDecoder().decode([Product].self, from: productData)
//            return products
//        } catch {
//
//            print("JSONDecoder error \(error)")
//
//            return []
//    }
//}
//
//    func add(user: User, product: Product) {
//
//        guard let productData = storage.get(key: "products_of_user_\(user.id)") else {
//            let array = [product]
//
//            do {
//                let arrayData = try JSONEncoder().encode(array)
//                storage.set(data: arrayData, key: "products_of_user_\(user.id)")
//            } catch {
//                print("JSONEncoder error \(error)")
//            }
//
//            return
//        }
//
//        do {
//            var productArray = try JSONDecoder().decode([Product].self, from: productData)
//
//            if let productIndex = productArray.firstIndex(where: { $0.id == product.id }) {
//                productArray[productIndex] = product
//            } else {
//                productArray.append(product)
//            }
//            let arrayData = try JSONEncoder().encode(productArray)
//            storage.set(data: arrayData, key: "products_of_user_\(user.id)")
//        } catch {
//            print("JSONEncoder error \(error)")
//        }
//    }
//}
