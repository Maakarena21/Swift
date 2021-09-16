//import UIKit
//
//
//struct SenderMoneyViewState {
//    var countryCode: String?
//    var phoneNumber: String?
//    var theAmount: String?
//    var senderMoney: String?
//    var receiverMoney: String?
//    var summTransfer: String?
//}
//
//protocol SenderMoneyPresenterView: AnyObject {
//    var senderMoneyViewState: SenderMoneyViewState? {get}
//}
//
//class SenderMoneyViewController: UIViewController {
//    var presenter: MoneySenderPresenter!
//
//
//
//    @IBOutlet weak var countryCode: UITextField!
//    @IBOutlet weak var phoneNumber: UITextField!
//    @IBOutlet weak var theAmount: UITextField!
//
//
//    @IBOutlet weak var senderMoney: UITextField!
//    @IBOutlet weak var receiverMoney: UITextField!
//    @IBOutlet weak var summTransfer: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        countryCode.placeholder = "Код страны"
//        phoneNumber.placeholder = "Номер телефона"
//        theAmount.placeholder = "Ввести сумму"
//
//        senderMoney.placeholder = "Отправитель денег"
//        receiverMoney.placeholder = "Получатель денег"
//        summTransfer.placeholder = "Cумма отправки"
//        view.backgroundColor = .white
//
//
//    }
//    @IBAction func createDeposit() {
//        presenter.createDepositButtonTapped()
//    }
//
//    @IBAction func addMoney() {
//        presenter.addMoneyButtonTapped()
//    }
//
//    @IBAction func removeMoney() {
//        let countryCode = countryCode.text ?? ""
//        let phoneNumber = phoneNumber.text ?? ""
//        let theAmount = theAmount.text ?? ""
//        do {
//
//        } catch {
//            print("MoneyWasNotSent")
//        }
//    }
//
//
//    @IBAction func moneyTransfer() {
//        presenter.moneyTransferButtonTapped()
//}
//    }
//
//extension SenderMoneyViewController: SenderMoneyPresenterView {
//    var senderMoneyViewState: SenderMoneyViewState? {
//        SenderMoneyViewState(countryCode: countryCode.text, phoneNumber: phoneNumber.text, theAmount: theAmount.text, senderMoney: senderMoney.text, receiverMoney: receiverMoney.text, summTransfer: summTransfer.text)
//    }
//
//}

import UIKit
import PhoneNumberKit

struct ComponentItem {
    var currency: String
}
struct PickerState {
    let components: [ComponentItem]?
}

struct TransactionViewState {
    let depositNumberPhone: String?
    let addMoneyToNumberPhone: String?
    let addSummToDeposit: String?
    let senderMoney: String?
    let receiverMoney: String?
    let transactionSumm: String?
    
    let fromCurrencyIndex: Int
    let toCurrencyIndex: Int
}


protocol SenderMoneyPresenterView: AnyObject {
    var transactionViewState: TransactionViewState? { get }
    var pickerState: PickerState? { get set }
    func display(currency: String)
}


class SenderMoneyViewController: UIViewController{
    
    var pickerState: PickerState?
    
    var presenter: MoneySenderPresenter!
    
    let depositNumberPhoneTextField = PhoneNumberTextField()
    let addMoneyToNumberPhoneTextField = PhoneNumberTextField()
    let addSummToDepositTextField = UITextField()
    let senderMoneyTextField = PhoneNumberTextField()
    let receiverMoneyTextField = PhoneNumberTextField()
    let transactionSummTextField = UITextField()
    let sendMoneyButton = UIButton()
    let addMoneyButton = UIButton()
    let createDepositButton = UIButton()
    let currencyPicker = UIPickerView()
    let currencyLabel = UILabel()
    let stackView = UIStackView()
    
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAdded()
        setupAdded()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.viewLoaded()
        }
    
    @objc func sendMoneyButtonTap() {
        view.endEditing(true)
        presenter.sendMoneyButtonTapped()
    }
    
    @objc func addMoneyButtonTap() {
        presenter.addMoneyButtonButtonTapped()
        print(currencyPicker.layer)
    }
    
    @objc func createDepositButtonTap() {
        presenter.createDepositButtonTapped()
    }
}

extension SenderMoneyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = ["USD", "RUB"]
        let row = data[row]
//            let row = pickerState?.components?[row].currency
           return row
        }
}

extension SenderMoneyViewController: SenderMoneyPresenterView {
    
    
    var transactionViewState: TransactionViewState? {
        TransactionViewState(depositNumberPhone: depositNumberPhoneTextField.text,
                             addMoneyToNumberPhone: addMoneyToNumberPhoneTextField.text,
                             addSummToDeposit: addSummToDepositTextField.text,
                             senderMoney: senderMoneyTextField.text,
                             receiverMoney: receiverMoneyTextField.text,
                             transactionSumm: transactionSummTextField.text,
                             fromCurrencyIndex: currencyPicker.selectedRow(inComponent: 0),
                             toCurrencyIndex: currencyPicker.selectedRow(inComponent: 1))
    }
    
    func display(currency: String) {
        currencyLabel.text = currency
    }
    
    private func viewAdded() {
        view.addSubview(stackView)
        stackView.addSubview(depositNumberPhoneTextField)
        stackView.addSubview(createDepositButton)
        stackView.addSubview(addMoneyToNumberPhoneTextField)
        stackView.addSubview(addSummToDepositTextField)
        stackView.addSubview(addMoneyButton)
        stackView.addSubview(senderMoneyTextField)
        stackView.addSubview(receiverMoneyTextField)
        stackView.addSubview(transactionSummTextField)
        stackView.addSubview(sendMoneyButton)
        stackView.addSubview(currencyPicker)
        stackView.addSubview(currencyLabel)

    }
    
    private func setupAdded() {
        setupStackView()
        setupDepositNumberPhoneTextField()
        setupCreateDepositButton()
        setupAddSummToDepositTextField()
        setupAddMoneyToNumberPhoneTextField()
        setupAddMoneyButton()

        setupSenderMoneyTextField()
        setupReceiverMoneyTextField()
        setupTransactionSummTextField()
        setupSendMoneyButton()
        setupCurrencyPicker()
        setupCurrnecyLabel()
    }
    
    
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
            
        ])
    }
    
    
    func setupDepositNumberPhoneTextField() {
        depositNumberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
//        depositNumberPhoneTextField.textOptions(placeholder: "Номер телефона для депозита")
        depositNumberPhoneTextField.placeholder = "Номер телефона для депозита"
        depositNumberPhoneTextField.withFlag = true
        
        NSLayoutConstraint.activate([
            depositNumberPhoneTextField.topAnchor.constraint(equalTo: stackView.topAnchor),
            depositNumberPhoneTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            depositNumberPhoneTextField.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            depositNumberPhoneTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            depositNumberPhoneTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    func setupCreateDepositButton() {
        createDepositButton.translatesAutoresizingMaskIntoConstraints = false
        createDepositButton.addTarget(self, action: #selector(createDepositButtonTap), for: .touchUpInside)
        createDepositButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        createDepositButton.translatesAutoresizingMaskIntoConstraints = false
        createDepositButton.setTitle("Создать депозит", for: .normal)
        createDepositButton.setTitleColor(.blue, for: .normal)
        createDepositButton.titleLabel?.textAlignment = .center
        
        NSLayoutConstraint.activate([
            createDepositButton.topAnchor.constraint(equalTo: depositNumberPhoneTextField.bottomAnchor, constant: 10),
            createDepositButton.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor),
            createDepositButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            createDepositButton.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    func setupAddSummToDepositTextField() {
        addSummToDepositTextField.translatesAutoresizingMaskIntoConstraints = false
        addSummToDepositTextField.placeholder = "Cумма"
        
        NSLayoutConstraint.activate([
            addSummToDepositTextField.topAnchor.constraint(equalTo: createDepositButton.bottomAnchor, constant: 10),
            addSummToDepositTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            addSummToDepositTextField.widthAnchor.constraint(equalToConstant: 70),
            addSummToDepositTextField.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    func setupAddMoneyToNumberPhoneTextField() {
        addMoneyToNumberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
//        addMoneyToNumberPhoneTextField.textOptions(placeholder: "Для добавления денег")
        addMoneyToNumberPhoneTextField.placeholder = "Для добавления денег"
        addMoneyToNumberPhoneTextField.withFlag = true
        
        NSLayoutConstraint.activate([
            addMoneyToNumberPhoneTextField.topAnchor.constraint(equalTo: addSummToDepositTextField.topAnchor),
            addMoneyToNumberPhoneTextField.leftAnchor.constraint(equalTo: addSummToDepositTextField.rightAnchor, constant: 20),
            addMoneyToNumberPhoneTextField.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            addMoneyToNumberPhoneTextField.widthAnchor.constraint(lessThanOrEqualTo: stackView.widthAnchor),
            addMoneyToNumberPhoneTextField.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    
    
    func setupAddMoneyButton() {
        addMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        addMoneyButton.addTarget(self, action: #selector(addMoneyButtonTap), for: .touchUpInside)
        addMoneyButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        addMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        addMoneyButton.setTitle("Добавить средства", for: .normal)
        addMoneyButton.setTitleColor(.blue, for: .normal)
        addMoneyButton.titleLabel?.textAlignment = .center
        
        NSLayoutConstraint.activate([
            addMoneyButton.topAnchor.constraint(equalTo: addSummToDepositTextField.bottomAnchor, constant: 10),
            addMoneyButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            addMoneyButton.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    func setupSenderMoneyTextField(){
        senderMoneyTextField.translatesAutoresizingMaskIntoConstraints = false
//        senderMoneyTextField.textOptions(placeholder: "Отправитель")
        senderMoneyTextField.placeholder = "Для добавления денег"
        senderMoneyTextField.withFlag = true
        
        NSLayoutConstraint.activate([
            senderMoneyTextField.topAnchor.constraint(equalTo: addMoneyButton.bottomAnchor, constant: 10),
            senderMoneyTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            senderMoneyTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            senderMoneyTextField.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            senderMoneyTextField.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    func setupReceiverMoneyTextField(){
        receiverMoneyTextField.translatesAutoresizingMaskIntoConstraints = false
//        receiverMoneyTextField.textOptions(placeholder: "Получатель")
        receiverMoneyTextField.placeholder = "Получатель"
        receiverMoneyTextField.withFlag = true
        
        NSLayoutConstraint.activate([
            receiverMoneyTextField.topAnchor.constraint(equalTo: senderMoneyTextField.bottomAnchor, constant: 10),
            receiverMoneyTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            receiverMoneyTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            receiverMoneyTextField.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            receiverMoneyTextField.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    func setupTransactionSummTextField(){
        transactionSummTextField.translatesAutoresizingMaskIntoConstraints = false
//        transactionSummTextField.textOptions(placeholder: "Сумма")
        transactionSummTextField.placeholder = "Cумма"
        
        NSLayoutConstraint.activate([
            transactionSummTextField.topAnchor.constraint(equalTo: receiverMoneyTextField.bottomAnchor, constant: 10),
            transactionSummTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            transactionSummTextField.widthAnchor.constraint(equalToConstant: 70),
            transactionSummTextField.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    func setupSendMoneyButton(){
        sendMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        sendMoneyButton.addTarget(self, action: #selector(sendMoneyButtonTap), for: .touchUpInside)
        sendMoneyButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        sendMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        sendMoneyButton.setTitle("Закинуть бабло", for: .normal)
        sendMoneyButton.setTitleColor(.blue, for: .normal)
        sendMoneyButton.titleLabel?.textAlignment = .center
        
        NSLayoutConstraint.activate([
            sendMoneyButton.topAnchor.constraint(equalTo: transactionSummTextField.topAnchor),
            sendMoneyButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            sendMoneyButton.heightAnchor.constraint(equalTo: depositNumberPhoneTextField.heightAnchor)
        ])
    }
    
    
    private func setupCurrencyPicker() {
        currencyPicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currencyPicker.topAnchor.constraint(equalTo: sendMoneyButton.bottomAnchor, constant: 10),
            currencyPicker.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            currencyPicker.rightAnchor.constraint(equalTo: stackView.rightAnchor)
            
        ])
    }
    
    private func setupCurrnecyLabel() {
        
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.layer.borderWidth = 2.0
        currencyLabel.layer.borderColor = UIColor.red.cgColor
        currencyLabel.layer.cornerRadius = 5
        currencyLabel.font = UIFont.systemFont(ofSize: 30)
        
        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(equalTo: currencyPicker.bottomAnchor, constant: 10),
            currencyLabel.widthAnchor.constraint(equalTo: self.currencyLabel.widthAnchor),
            currencyLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}
