import Foundation

let assembly1 = BankAssembly()
var storageBank = assembly1.storagesAssembly.userDefaults
let bank = assembly1.bank

//let testclient1 = bank.createClient(name: "John", secondName: "John", lastName: "John", email: "John", phone: Phone(countryCode: 7, numberPhone: 2131241), address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))

//let client1 = bank.createClient(name: "Сергей", secondName: "Дмитриевич", lastName: "Полуэктов", email: "sdr@mail.ru", phone: Phone(countryCode: 7, numberPhone: 9034532112), address: Address(country: "Россия", city: "Москва", street: "Героев Подшипников", house: "1к4", flat: 1, floor: 1))
//
//let client2 = bank.createClient(name: "Ivan", secondName: "Ivanov", lastName: "Ivanovich", email: "ii@gmail.com", phone: Phone(countryCode: 7, numberPhone: 9051234873), address: Address(country: "Russia", city: "Moscow", street: "Unknown str", house: "24k2", flat: 14, floor: 3))

//let depositProduct = bank.createDepositProduct(user: testclient1)
//let creditProduct1 = bank.createCreditProduct(user: testclient1)

assembly1.storagesAssembly.userDefaults.remove(key: "clients")

if let data1 = assembly1.storagesAssembly.userDefaults.get(key: "clients") {
    let data2 = String(data: data1, encoding: .utf8)
    print(data2)
}


