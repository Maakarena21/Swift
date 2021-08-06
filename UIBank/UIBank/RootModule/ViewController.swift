//
//  ViewController.swift
//  UIBank
//
//  Created by Silence on 14.07.2021.
//
import EasyDi
import UIKit
import PhoneNumberKit


class ViewController: UIViewController {
//    let bank = BankAssembly.instance().bank
      var bank: Bank!
      var userRouter: UserRouter!
//    let bankAssembly: BankAssembly!
    

    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField:UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var numberPhoneTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var floorTextField: UITextField!
    @IBOutlet weak var flatTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nameTextField.placeholder = "Имя"
        secondNameTextField.placeholder = "Фамилия"
        lastNameTextField.placeholder = "Отчество"
        
        emailTextField.placeholder = "Email"
        countryCodeTextField.placeholder = "Код страны"
        numberPhoneTextField.placeholder = "Номер телефона"
        
        countryTextField.placeholder = "Страна"
        cityTextField.placeholder = "Город"
        streetTextField.placeholder = "Улица"
        houseTextField.placeholder = "Дом"
        flatTextField.placeholder = "Квартира"
        floorTextField.placeholder = "Этаж"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton() {
        view.endEditing(true)
        
        
        
        let name = nameTextField.text ?? ""
        let secondName = secondNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let countryCode = countryCodeTextField.text ?? ""
        let numberPhone = numberPhoneTextField.text ?? ""
        let country = countryTextField.text ?? ""
        let city = cityTextField.text ?? ""
        let street = streetTextField.text ?? ""
        let house = houseTextField.text ?? ""
        let floor = floorTextField.text ?? ""
        let flat = flatTextField.text ?? ""
        
        
        
       let user = bank.createClient(name: name,
                          secondName: secondName,
                          lastName: lastName,
                          email: email,
                          phone: Phone(countryCode: Int(countryCode) ?? 0, numberPhone: Int(numberPhone) ?? 0),
                          address: Address(country: country,
                                           city: city,
                                           street: street,
                                           house: house,
                                           flat: Int(flat) ?? 0,
                                           floor: Int(floor) ?? 0))


        userRouter.userDetails(user: user)
    }
    
    
    @IBAction func showClientButton() {
        userRouter.usersList()
    }
    
    
    @IBAction func moneySenderButton() {
        userRouter.moneySender()
    }
}


