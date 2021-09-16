

import UIKit
import PhoneNumberKit



struct ProductDetailsViewState {
    var addMoneyToDeposit: String?
    var receiverNumberPhone: String?
}

protocol ProductDetailsView: AnyObject {
    var productDetailsViewState: ProductDetailsViewState? {get}
    func diplay(deposit: String)
}

class ProductDetailsViewController: UIViewController {
    var presenter: ProductDetailsPresenter!
    
    

        let depositAmountLabel = UILabel()
        let addMoneyToDepositTextField = UITextField()
        let receiverNumberPhone = PhoneNumberTextField()
        let addMoneyToDepositButton = UIButton()
        let moneyTransferButton = UIButton()
        let stackView = UIStackView()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        view.backgroundColor = .white
        
    }
    @objc private func addMoneyButton() {
        presenter.addMoneyButtonTapped()
        }
        
    @objc private func transferMoneyButton() {
        presenter.moneyTransferButtonTapped()
        }
}
extension ProductDetailsViewController: ProductDetailsView {
    var productDetailsViewState: ProductDetailsViewState? {
        ProductDetailsViewState(addMoneyToDeposit: addMoneyToDepositTextField.text, receiverNumberPhone: receiverNumberPhone.text)
        }
    
    internal func diplay(deposit: String) {
        depositAmountLabel.text = deposit
        addViews()
        setupViewElements()
    }
    
    private func addViews() {
        view.addSubview(stackView)
        stackView.addSubview(depositAmountLabel)
        stackView.addSubview(addMoneyToDepositTextField)
        stackView.addSubview(receiverNumberPhone)
        stackView.addSubview(addMoneyToDepositButton)
        stackView.addSubview(moneyTransferButton)
        
    }
    
    private func setupViewElements() {
        setupStackView()
        setupDepositAmountLabel()
        setupAddMoneyToDepositTextField()
        setupAddMoneyToDepositButton()
        setupMoneyTransferButton()
        setupReceiverPhoneNumber()
        
    }
    func setupStackView() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
                stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
                stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        }
    
    private func setupDepositAmountLabel() {
                depositAmountLabel.translatesAutoresizingMaskIntoConstraints = false
                depositAmountLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        NSLayoutConstraint.activate([
                   depositAmountLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
                   depositAmountLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor),
                   depositAmountLabel.widthAnchor.constraint(equalTo: self.depositAmountLabel.widthAnchor),
                   depositAmountLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 35)
               ])
        }
    
    private func setupAddMoneyToDepositTextField() {
        addMoneyToDepositTextField.translatesAutoresizingMaskIntoConstraints = false
        addMoneyToDepositTextField.layer.cornerRadius = 12
        addMoneyToDepositTextField.placeholder = "Деньги"
        addMoneyToDepositTextField.keyboardType = .numberPad
        addMoneyToDepositTextField.layer.borderWidth = 1.0
        addMoneyToDepositTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        NSLayoutConstraint.activate([
            addMoneyToDepositTextField.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            addMoneyToDepositTextField.widthAnchor.constraint(equalTo: self.addMoneyToDepositTextField.widthAnchor),
            addMoneyToDepositTextField.heightAnchor.constraint(equalTo: depositAmountLabel.heightAnchor),
            addMoneyToDepositTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 5)
                ])
    }
    
    private func setupAddMoneyToDepositButton() {
        
        addMoneyToDepositButton.translatesAutoresizingMaskIntoConstraints = false
        addMoneyToDepositButton.addTarget(self, action: #selector(addMoneyButton), for: .touchUpInside)
        addMoneyToDepositButton.backgroundColor = .systemOrange
        addMoneyToDepositButton.layer.cornerRadius = 12
        addMoneyToDepositButton.setTitle("Пополнить", for: .normal)
        addMoneyToDepositButton.layer.masksToBounds = true
        
        addMoneyToDepositButton.setTitleColor(.black, for: .normal)
        addMoneyToDepositButton.setImage(UIImage(systemName: "folder"), for: .normal)
        addMoneyToDepositButton.tintColor = .black
        
        NSLayoutConstraint.activate([
            addMoneyToDepositButton.topAnchor.constraint(equalTo: addMoneyToDepositTextField.bottomAnchor, constant: 15),
            addMoneyToDepositButton.widthAnchor.constraint(equalTo: self.addMoneyToDepositButton.widthAnchor),
            addMoneyToDepositButton.heightAnchor.constraint(equalTo: addMoneyToDepositTextField.heightAnchor)
            
                ])
        
    }
    
    private func setupMoneyTransferButton() {
        
        moneyTransferButton.translatesAutoresizingMaskIntoConstraints = false
        moneyTransferButton.addTarget(self, action: #selector(transferMoneyButton), for: .touchUpInside)
        moneyTransferButton.backgroundColor = .systemOrange
        moneyTransferButton.setTitle("Перевести деньги", for: .normal)
        moneyTransferButton.layer.cornerRadius = 12
        moneyTransferButton.layer.masksToBounds = true
        moneyTransferButton.setTitleColor(.black, for: .highlighted)
        moneyTransferButton.setImage(UIImage(systemName: "folder"), for: .normal)
        moneyTransferButton.tintColor = .black
        NSLayoutConstraint.activate([
            moneyTransferButton.topAnchor.constraint(equalTo: addMoneyToDepositButton.bottomAnchor, constant: 15),
            moneyTransferButton.widthAnchor.constraint(equalTo: self.moneyTransferButton.widthAnchor),
            moneyTransferButton.heightAnchor.constraint(equalTo: depositAmountLabel.heightAnchor)

                ])
    }
    
    private func setupReceiverPhoneNumber() {
            receiverNumberPhone.translatesAutoresizingMaskIntoConstraints = false
            receiverNumberPhone.placeholder = "Номер телефона"
            receiverNumberPhone.withFlag = true
            receiverNumberPhone.layer.cornerRadius = 12
            receiverNumberPhone.layer.borderWidth = 1.0
            receiverNumberPhone.layer.borderColor = UIColor.systemGray.cgColor
            
            NSLayoutConstraint.activate([
                
                receiverNumberPhone.topAnchor.constraint(equalTo: moneyTransferButton.bottomAnchor, constant: 15),
                receiverNumberPhone.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 150),
                receiverNumberPhone.widthAnchor.constraint(equalTo: self.receiverNumberPhone.widthAnchor),
                receiverNumberPhone.heightAnchor.constraint(equalTo: depositAmountLabel.heightAnchor)
            ])
        }
    }
