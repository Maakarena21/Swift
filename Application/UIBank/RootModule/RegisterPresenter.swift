import Foundation
import PhoneNumberKit

protocol RegisterPresenter {
    func viewLoaded()
    func registerButtonTapped()
    func showClientsButtonTapped()
    func moneySenderButtonTapped()
}

class RegisterPresenterImpl {
    weak var registerView: RegisterView?
    var bank: Bank!
    var userRouter: UserRouter!
    let phoneNumberKit = PhoneNumberKit()
}


extension RegisterPresenterImpl: RegisterPresenter {
    func viewLoaded() {
        registerView?.displayElements()
    }
    
    func showClientsButtonTapped() {
        userRouter.usersList()
    }
    
    func moneySenderButtonTapped() {
        userRouter.moneySender()
    }
    
 

    func registerButtonTapped() {


        guard let name = registerView?.descriptionState?.name ,
              let secondName = registerView?.descriptionState?.secondName ,
              let lastName = registerView?.descriptionState?.lastName ,
              let email = registerView?.descriptionState?.email,
              let numberPhone = registerView?.descriptionState?.numberPhone ,
              let country = registerView?.descriptionState?.country,
              let street = registerView?.descriptionState?.street ,
              let city = registerView?.descriptionState?.city ,
              let house = registerView?.descriptionState?.house,
              let floor = registerView?.descriptionState?.floor ,
              let flat = registerView?.descriptionState?.flat else { return }


        do {
            let phoneNumber = try phoneNumberKit.parse("\(numberPhone)")
            let phoneCountryCode = phoneNumber.countryCode
            let phoneNumberBoby = phoneNumber.nationalNumber
            

            let user = bank.createClient(name: name, secondName: secondName, lastName: lastName, email: email, phone: Phone(countryCode: Int(phoneCountryCode), numberPhone: Int(phoneNumberBoby)), address: Address(country: country, city: city, street: street, house: house, flat: Int(flat) ?? 0, floor: Int(floor) ?? 0))
            
            print(user)
            userRouter.userDetails(user: user)
        } catch {
            print("parsing error")
        }
       
    }

}
