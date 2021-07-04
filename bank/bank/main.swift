import Foundation



let assembly = BankAssembly()

let bank1 = assembly.bank //

let client1 = bank1.createClient(name: "John1", secondName: "John1", lastName: "John1", email: "John1", phone: Phone(countryCode: 7, numberPhone: 9681448845), address: Address(country: "Russia1", city: "Moscow1", street: "Random1", house: "Random1", flat: 1, floor: 1))

let depositProduct1 = bank1.createDepositProduct(user: client1)

let productPreferences1 = ProductPreferences(productReceiverId: depositProduct1.id, productSenderId: depositProduct1.id)
bank1.set(user: client1, set: productPreferences1)

try bank1.add(phone: Phone(countryCode: 7, numberPhone: 9681448845), product: depositProduct1, money: 200)


let bank2 = assembly.bank

let client2 = bank2.createClient(name: "Johh2", secondName: "John2", lastName: "John2", email: "John2", phone: Phone(countryCode: 7, numberPhone: 9671555927), address: Address(country: "Russia2", city: "Moscow2", street: "Random2", house: "Random2", flat: 1, floor: 1))


let depositProduct2 = bank2.createDepositProduct(user: client2)

let productPreferences2 = ProductPreferences(productReceiverId: depositProduct2.id, productSenderId: depositProduct2.id)
bank2.set(user: client2, set: productPreferences2)

let servicesAssembly = ServicesAssembly()
let fastPaymentsService = servicesAssembly.fastPaymentService

try fastPaymentsService.send(from: Phone(countryCode: 7, numberPhone: 9681448845), summ: 150, to: Phone(countryCode: 7, numberPhone: 9671555927))

try printData(key: "products_of_user_\(client1.id)", type: [Product].self)
try printData(key: "products_of_user_\(client2.id)", type: [Product].self)



