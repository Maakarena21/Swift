

import Foundation
import PhoneNumberKit


protocol ProductDetailsPresenter {
//    func createDepositButtonTapped()
    func addMoneyButtonTapped()
    func moneyTransferButtonTapped()
    func viewLoaded()
}

class ProductDetailsPresenterImpl: ProductDetailsPresenter {
   
    var user: User!
    var product: Product!
    var userRouter: UserRouter!
    var moneyService: MoneyService!
    var fastPayments: FastPaymentsService!
    var bank: Bank!
    weak var view: ProductDetailsView?
    private let phoneNumberKit = PhoneNumberKit()
    private let formetter = ProductFormatter()
    
    func addMoneyButtonTapped() {
        guard let totalAmount = view?.productDetailsViewState?.addMoneyToDeposit else {return}
        do {
            try moneyService.recieve(summ: Float(totalAmount) ?? 0, phone: user.phone)
        } catch {
            print("not added")
        }
    }
    
    func moneyTransferButtonTapped() {
        guard let phoneNumber = view?.productDetailsViewState?.receiverNumberPhone,
              let totalAmount = view?.productDetailsViewState?.addMoneyToDeposit  else {return}
        
        do {
            let number = try phoneNumberKit.parse(phoneNumber)
                       let codeNumber = number.countryCode
                       let numberBody = number.nationalNumber
                       try fastPayments.send(from: user.phone,
                                                   summ: Float(totalAmount) ?? 0,
                                                   to: Phone(countryCode: Int(codeNumber),
                                                             numberPhone: Int(numberBody)))
                       
                   } catch {
                       print("parsing Error")
                   }
        
        }
    
    func viewLoaded() {
        view?.diplay(deposit: formetter.format(product: product))
        }
    }
   
    
    
//    func createDepositButtonTapped() {
//
//        guard let countryCode = productDetailsView?.productDetailsViewState?.countryCode,
//              let numberPhone = productDetailsView?.productDetailsViewState?.numberPhone else {return}
//        do {
//          let user = try bank.search(phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(numberPhone) ?? 0))
//          let createDeposit = bank.createDepositProduct(user: user)
//            print(createDeposit)
//        } catch {
//            print("UserNotFound")
//        }
//    }
//
//    func addMoneyButtonTapped() {
//        guard let countryCode = productDetailsView?.productDetailsViewState?.countryCode,
//              let numberPhone = productDetailsView?.productDetailsViewState?.numberPhone,
//              let theAmount = productDetailsView?.productDetailsViewState?.theAmount  else {return}
//        do {
//            try moneyService.recieve(summ: Float(theAmount) ?? 0.0, phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(numberPhone) ?? 0))
//            print("Money added to \(theAmount)")
//        } catch {
//            print("NoMoneyAdded")
//        }
//    }
//
//    func moneyTransferButtonTapped() {
//        guard let senderMoney = productDetailsView?.productDetailsViewState?.senderMoney ,
//              let countryCode = productDetailsView?.productDetailsViewState?.countryCode,
//              let _ = productDetailsView?.productDetailsViewState?.numberPhone,
//              let receiverMoney = productDetailsView?.productDetailsViewState?.receiverMoney,
//              let summTransfer = productDetailsView?.productDetailsViewState?.summTransfer else  {return}
//        do {
//            try fastPayments.send(from: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(senderMoney) ?? 0), summ: Float(summTransfer) ?? 0.0, to: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(receiverMoney) ?? 0))
//            print("MoneyTransferred \(summTransfer)")
//        } catch {
//            print(print("NotBeenTransferred"))
//        }
//    }
//}


