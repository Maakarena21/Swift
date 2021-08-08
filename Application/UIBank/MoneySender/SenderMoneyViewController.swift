import UIKit

class SenderMoneyViewController: UIViewController {
    var bank: Bank!
    var services: ServicesAssembly!
    var moneyService: MoneyService!
    
    
    
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

        
    }
    
    
    @IBAction func createDeposit() {
        let countryCode = countryCode.text ?? ""
        let phoneNumber = phoneNumber.text ?? ""
        do {
            let user = try bank.search(phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0))
            let createDeposit = bank.createDepositProduct(user: user)
            print(createDeposit)
        } catch {
            print("UserNotFound")
        }
    }
    
    @IBAction func addMoney() {
        let countryCode = countryCode.text ?? ""
        let phoneNumber = phoneNumber.text ?? ""
        let theAmount = theAmount.text ?? ""
        do {
            
            let addMoney = try services.moneyService.recieve(summ: Float(theAmount) ?? 0.0, phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0))
           
            
            print("Money added to")
        } catch {
            print("NoMoneyAdded")
        }
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
        
        let alert = UIAlertController(title: "", message: "Данные введены неверно", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        
        let countryCode = countryCode.text ?? ""
        let phoneNumber = phoneNumber.text ?? ""
        let senderMoneyPhone = senderMoney.text ?? ""
        let receiverMoneyPhone = receiverMoney.text ?? ""
        let summTransfer = summTransfer.text ?? ""
        
        
        do {
            
            if senderMoneyPhone == "" || receiverMoneyPhone == "" {
                self.present(alert, animated: true, completion: nil)
            } else {
                
              let moneyTransfer = try services.fastPaymentsService.send(from: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0), summ: Float(summTransfer) ?? 0.0, to: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(phoneNumber) ?? 0))
                print("MoneyTransferred")
            }
        } catch {
            print("NotBeenTransferred")
        }
        
    }
}

