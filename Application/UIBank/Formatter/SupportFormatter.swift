
import UIKit

struct ProductFormatter {
    func format(product: Product) -> String {
        switch product.type {
        case let .credit(credit):
            return "Кредит - \(credit.summ)"
        case let .deposit(deposit):
        return "Депозит - \(deposit.summ)"
        }
    }
}

struct PhoneFormatter {
    func format(phone: Phone) -> String {
        return "\(phone.countryCode) \(phone.numberPhone)"
    }
}

struct UserFormatter {
    func format(userInfo: User) -> String {
        return "\(userInfo.name) \(userInfo.secondName) \(userInfo.lastName)"
    }
}
