

import Foundation

protocol UserDetailsPresenter {
    func viewLoaded()
    func cellTappedButton(indexPath: IndexPath)
    func createProductButtonTapped()
}

class UserDetailsPresenterImpl: UserDetailsPresenter {
 
    
    private let userFormatter = UserFormatter()
    var user: User!
    var products: [Product]!
    var userRouter: UserRouter!
    var bank: Bank!
    var assembly: CreateProductAssembly!
    
    private let formatter = ProductFormatter()
    weak var view: UserDetailsView?
    
    func createProductButtonTapped() {
        userRouter.createProduct(user: user) { product in
        var array = self.view?.currentState?.products ?? []
            array.append(ProductInfo(productName: product.name, productType: self.formatter.format(product: product)))
            self.view?.currentState = ProductState(products: array)
            
        }
//        let product = bank.createDepositProduct(user: user)
//        userRouter.productDetails(user: user, product: product)
    }
    
    func cellTappedButton(indexPath: IndexPath) {
        let product = bank.allProducts(user: user)[indexPath.row]
        userRouter.productDetails(user: user, product: product)
        print(product)
    }
    func viewLoaded() {
        
        view?.display(fullName: user.name, secondName: user.secondName, lastName: user.lastName)
        products = bank.allProducts(user: user)
        let productType = ProductFormatter()
        view?.currentState = ProductState(products: products.map{ProductInfo(productName: $0.name + " " + $0.id,
                                                                        productType: productType.format(product: $0))})
    }
}


