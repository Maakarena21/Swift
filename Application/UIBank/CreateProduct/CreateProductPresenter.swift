
import Foundation

protocol CreateProductPresenter {
    func viewLoaded()
    func createProductButtonTapped()
}

class CreateProductPresenterImpl: CreateProductPresenter {
    var bank: Bank!
    var router: UserRouter!
    var user: User!
    var moneyService: MoneyService!
    
    var result: ((Product) -> ())? // callback
    weak var view: ProductView?
    
    
    func viewLoaded() {
        view?.display()
        view?.viewState = ProductViewState(addMoneyTextField: nil, productInfo: [CreateProductInfo.init(productName: "Депозитный", id: "Депозит", selected: false), CreateProductInfo.init(productName: "Кредитный", id: "Кредит", selected: false)])
        
    }
    
    func createProductButtonTapped() {
        guard let product = view?.viewState.productInfo.first(where: {$0.selected }) else {return}
        if product.id == "Депозит", let summ = view?.viewState.addMoneyTextField, let floatSumm = Float(summ) {
            let createDepositProduct = bank.createDepositProduct(user: user, initialSumm: Float(summ) ?? 0 )
            print(createDepositProduct)
            result?(createDepositProduct)
            router.dissmiss()

        } else if product.id == "Кредит" {
           let createCreditProduct = bank.createCreditProduct(user: user)
            print(createCreditProduct)
            router.dissmiss()
        }
        
    
    }
}
