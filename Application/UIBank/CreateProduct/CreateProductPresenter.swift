
import Foundation

protocol CreateProductPresenter {
    func viewLoaded()
    func createProductButtonTapped()
}

class CreateProductPresenterImpl: CreateProductPresenter {
    var bank: Bank!
    var userRouter: UserRouter!
    var user: User!
    var moneyService: MoneyService!
    
    weak var view: ProductView?
    
    
    func viewLoaded() {
        view?.display()
        view?.viewState = ProductViewState(addMoneyTextField: nil, productInfo: [CreateProductInfo.init(productName: "Депозитный", id: "Депозит", selected: false), CreateProductInfo.init(productName: "Кредитный", id: "Кредит", selected: false)])
        
    }
    
    func createProductButtonTapped() {
        guard let product = view?.viewState.productInfo.first(where: {$0.selected }) else {return}
        if product.id == "Депозит", let summ = view?.viewState.addMoneyTextField, let floatSumm = Float(summ) {
          let createDepositProduct = bank.createDepositProduct(user: user)
            print(createDepositProduct)

        } else if product.id == "Кредит" {
           let createCreditProduct = bank.createCreditProduct(user: user)
            print(createCreditProduct)
    }
    
    }
}
