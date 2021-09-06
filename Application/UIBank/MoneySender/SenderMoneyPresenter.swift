

import Foundation


protocol MoneySenderPresenter {
    func createDepositButtonTapped()
    func addMoneyButtonTapped()
    func moneyTransferButtonTapped()
}


class MoneySenderPresenterImpl: MoneySenderPresenter {
    var bank: Bank!
    var moneyService: MoneyService!
    var fastPaymentsService: FastPaymentsService!
    weak var senderMoneyPresenterView: SenderMoneyPresenterView?
    
    
    func createDepositButtonTapped() {
        guard let countryCode = senderMoneyPresenterView?.senderMoneyViewState?.countryCode ,
              let phoneNumber = senderMoneyPresenterView?.senderMoneyViewState?.phoneNumber else { return }
        do {
            let user = try bank.search(phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0))
            let createDeposit = bank.createDepositProduct(user: user)
            print(createDeposit)
        } catch {
            print("UserNotFound")
        }
    }
    
    func addMoneyButtonTapped() {
        guard let countryCode = senderMoneyPresenterView?.senderMoneyViewState?.countryCode ,
              let phoneNumber = senderMoneyPresenterView?.senderMoneyViewState?.phoneNumber ,
              let theAmount = senderMoneyPresenterView?.senderMoneyViewState?.theAmount else {return}
        do {
            
            try moneyService.recieve(summ: Float(theAmount) ?? 0.0, phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0))
           
            
            print("Money added to \(theAmount)")
        } catch {
            print("NoMoneyAdded")
        }
    }
    
    func moneyTransferButtonTapped() {
        guard let countryCode = senderMoneyPresenterView?.senderMoneyViewState?.countryCode ,
              let phoneNumber = senderMoneyPresenterView?.senderMoneyViewState?.phoneNumber ,
              let summTransfer = senderMoneyPresenterView?.senderMoneyViewState?.summTransfer else {return}
        do {
                
            try fastPaymentsService.send(from: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0), summ: Float(summTransfer) ?? 0.0, to: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0))
                print("MoneyTransferred \(summTransfer)")
            
        } catch {
            print("NotBeenTransferred")
        }
    }
}
