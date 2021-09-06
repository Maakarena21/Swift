import UIKit


struct SenderMoneyViewState {
    var countryCode: String?
    var phoneNumber: String?
    var theAmount: String?
    var senderMoney: String?
    var receiverMoney: String?
    var summTransfer: String?
}

protocol SenderMoneyPresenterView: AnyObject {
    var senderMoneyViewState: SenderMoneyViewState? {get}
}

class SenderMoneyViewController: UIViewController {
    var presenter: MoneySenderPresenter!
    
    
    
    @IBOutlet weak var countryCode: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var theAmount: UITextField!
    
    
    @IBOutlet weak var senderMoney: UITextField!
    @IBOutlet weak var receiverMoney: UITextField!
    @IBOutlet weak var summTransfer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryCode.placeholder = "Код страны"
        phoneNumber.placeholder = "Номер телефона"
        theAmount.placeholder = "Ввести сумму"

        senderMoney.placeholder = "Отправитель денег"
        receiverMoney.placeholder = "Получатель денег"
        summTransfer.placeholder = "Cумма отправки"
        view.backgroundColor = .white

        
    }
    @IBAction func createDeposit() {
        presenter.createDepositButtonTapped()
    }
    
    @IBAction func addMoney() {
        presenter.addMoneyButtonTapped()
    }
    
    @IBAction func removeMoney() {
        let countryCode = countryCode.text ?? ""
        let phoneNumber = phoneNumber.text ?? ""
        let theAmount = theAmount.text ?? ""
        do {
            
        } catch {
            print("MoneyWasNotSent")
        }
    }
    
    
    @IBAction func moneyTransfer() {
        presenter.moneyTransferButtonTapped()
}
    }

extension SenderMoneyViewController: SenderMoneyPresenterView {
    var senderMoneyViewState: SenderMoneyViewState? {
        SenderMoneyViewState(countryCode: countryCode.text, phoneNumber: phoneNumber.text, theAmount: theAmount.text, senderMoney: senderMoney.text, receiverMoney: receiverMoney.text, summTransfer: summTransfer.text)
    }

}
