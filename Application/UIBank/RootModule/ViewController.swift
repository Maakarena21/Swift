
import UIKit
import PhoneNumberKit


struct DescriptionState {
    var name: String?
    var secondName: String?
    var lastName: String?
    var email: String?
    var numberPhone: String?
    var country: String?
    var city: String?
    var street: String?
    var house: String?
    var floor: String?
    var flat: String?

}

protocol RegisterView: AnyObject {
    var descriptionState: DescriptionState? {get}
    func displayElements()
}

class ViewController: UIViewController {
    
    var presenter: RegisterPresenter!
    var senderMoneyPresenter: SenderMoneyPresenterView!
    
    
    let numberPhoneTextField = PhoneNumberTextField()
    let nameTextField = UITextField()
    let secondNameTextField = UITextField()
    let lastNameTextField = UITextField()
    let emailTextField = UITextField()
    let countryTextField = UITextField()
    let cityTextField = UITextField()
    let streetTextField = UITextField()
    let houseTextField = UITextField()
    let floorTextField = UITextField()
    let flatTextField = UITextField()
    let registerButton = UIButton()
    let showClientsButton = UIButton()
    let moneyTransferButton = UIButton()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonRegistration() {
            view.endEditing(true)
        presenter.registerButtonTapped()
        }
    
    @objc func listRegisterUsers() {
        view.endEditing(true)
        presenter.showClientsButtonTapped()
    }
    
    @objc func moneyTransfer() {
        view.endEditing(true)
        presenter.moneyTransferuttonTapped()
    }
// vvpskvd
    
}

extension ViewController: RegisterView {
    
    var descriptionState: DescriptionState? {
        DescriptionState(name: nameTextField.text,
                         secondName: secondNameTextField.text,
                         lastName: lastNameTextField.text,
                         email: emailTextField.text,
                         numberPhone: numberPhoneTextField.text,
                         country: countryTextField.text,
                         city: cityTextField.text,
                         street: streetTextField.text,
                         house: houseTextField.text,
                         floor: floorTextField.text,
                         flat: flatTextField.text)
    }
    
    internal func displayElements() {
        addViewElements()
        setupAddView()
        
    }
    
    
    private func setupAddView() {
        setupStackView()
        setupNameTextField()
        setupSecondNameTextField()
        setupLastNameTextField()
        setupEmailTextField()
        setupCountryTextField()
        setupNumberPhoneTextField()
        setupCityTextField()
        setupHouseTextField()
        setupStreetTextField()
        setupFloorTextField()
        setupFlatTextField()
        setupRegisterButton()
        setupShowClientsButton()
        configMoneyTransfer()

    }
    
    private func addViewElements() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(secondNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(numberPhoneTextField)
        stackView.addArrangedSubview(countryTextField)
        stackView.addArrangedSubview(cityTextField)
        stackView.addArrangedSubview(streetTextField)
        stackView.addArrangedSubview(houseTextField)
        stackView.addArrangedSubview(floorTextField)
        stackView.addArrangedSubview(flatTextField)
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(showClientsButton)
        stackView.addArrangedSubview(moneyTransferButton)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
               ])
    }
    
    
    private func setupNameTextField() {
        nameTextField.placeholder = "Имя"
        nameTextField.layer.cornerRadius = 5.0
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.systemGray.cgColor
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
          
          
      }
    
    private func setupSecondNameTextField() {
        secondNameTextField.placeholder = "Фамилия"
        secondNameTextField.layer.cornerRadius = 5.0
        secondNameTextField.layer.borderWidth = 1.0
        secondNameTextField.layer.borderColor = UIColor.systemGray.cgColor
        secondNameTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLastNameTextField() {
        lastNameTextField.placeholder = "Отчество"
        lastNameTextField.layer.cornerRadius = 5.0
        lastNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupEmailTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 5.0
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupCountryTextField() {
        countryTextField.placeholder = "Страна"
        countryTextField.layer.cornerRadius = 5.0
        countryTextField.layer.borderWidth = 1.0
        countryTextField.layer.borderColor = UIColor.systemGray.cgColor
        countryTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func setupNumberPhoneTextField() {
        numberPhoneTextField.placeholder = "Номер телефона"
        numberPhoneTextField.layer.cornerRadius = 5.0
        numberPhoneTextField.layer.borderWidth = 1.0
        numberPhoneTextField.layer.borderColor = UIColor.systemGray.cgColor
        numberPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        numberPhoneTextField.withFlag = true
        
    }
    
    private func setupCityTextField()  {
        cityTextField.placeholder = "Город"
        cityTextField.layer.cornerRadius = 5.0
        cityTextField.layer.borderWidth = 1.0
        cityTextField.layer.borderColor = UIColor.systemGray.cgColor
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupStreetTextField() {
        streetTextField.placeholder = "Улица"
        streetTextField.layer.cornerRadius = 5.0
        streetTextField.layer.borderWidth = 1.0
        streetTextField.layer.borderColor = UIColor.systemGray.cgColor
        streetTextField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupHouseTextField() {
        houseTextField.placeholder = "Дом"
        houseTextField.layer.cornerRadius = 5.0
        houseTextField.layer.borderWidth = 1.0
        houseTextField.layer.borderColor = UIColor.systemGray.cgColor
        houseTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupFloorTextField() {
        floorTextField.placeholder = "Этаж"
        floorTextField.layer.cornerRadius = 5.0
        floorTextField.layer.borderWidth = 1.0
        floorTextField.layer.borderColor = UIColor.systemGray.cgColor
        floorTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupFlatTextField() {
        flatTextField.placeholder = "Квартира"
        flatTextField.layer.cornerRadius = 5.0
        flatTextField.layer.borderWidth = 1.0
        flatTextField.layer.borderColor = UIColor.systemGray.cgColor
        flatTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupRegisterButton() {
        registerButton.addTarget(self, action: #selector(buttonRegistration), for: .touchUpInside)
        registerButton.setTitle("Зарегистрировать", for: .normal)
        
        registerButton.backgroundColor = .red
        registerButton.layer.cornerRadius = 12
        registerButton.layer.masksToBounds = true
        registerButton.setTitleColor(.white, for: .highlighted)
        registerButton.setImage(UIImage(systemName: "folder"), for: .normal)
        registerButton.tintColor = .black
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func setupShowClientsButton() {
        showClientsButton.addTarget(self, action: #selector(listRegisterUsers), for: .touchUpInside)
        showClientsButton.setTitle("Показать список зарегистрированных", for: .normal)
        
        showClientsButton.backgroundColor = .systemBlue
        showClientsButton.layer.cornerRadius = 12
        showClientsButton.layer.masksToBounds = true
        showClientsButton.setTitleColor(.darkText, for: .highlighted)
        showClientsButton.setImage(UIImage(systemName: "folder"), for: .normal)
        showClientsButton.tintColor = .black
        showClientsButton.translatesAutoresizingMaskIntoConstraints = false
      
        
    }
    
    private func configMoneyTransfer() {
        moneyTransferButton.addTarget(self, action: #selector(moneyTransfer), for: .touchUpInside)
        moneyTransferButton.setTitle("Перевод Денег", for: .normal)
        
        moneyTransferButton.backgroundColor = .green
        moneyTransferButton.layer.cornerRadius = 12
        moneyTransferButton.layer.masksToBounds = true
        moneyTransferButton.setTitleColor(.darkText, for: .highlighted)
        moneyTransferButton.setImage(UIImage(systemName: "folder"), for: .normal)
        moneyTransferButton.tintColor = .black
        moneyTransferButton.translatesAutoresizingMaskIntoConstraints = false
    }
}
