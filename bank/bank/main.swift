import Foundation



let assembly = BankAssembly()

let bank = assembly.bank

let testclient1 = bank.createClient(name: "John", secondName: "John", lastName: "John", email: "John", phone: Phone(countryCode: 7, numberPhone: 2131241), address: Address(country: "Russia", city: "Moscow", street: "Random", house: "Random", flat: 1, floor: 1))

var depositProduct = bank.createDepositProduct(user: testclient1)



try bank.add(phone: Phone(countryCode: 7, numberPhone: 2131241), product: depositProduct, money: 200)

let clients1 = assembly.storagesAssembly.inMemory.get(key: "products_of_user_\(testclient1.id)")
if let clients1 = try? JSONDecoder().decode([Product].self, from: clients1!) {
    print(clients1)
}


try bank.remove(phone: Phone(countryCode: 7, numberPhone: 2131241), product: depositProduct, money: 100)


let clients = assembly.storagesAssembly.inMemory.get(key: "products_of_user_\(testclient1.id)")
if let clients = try? JSONDecoder().decode([Product].self, from: clients!) {
    print(clients)
}

try bank.add(phone: Phone(countryCode: 7, numberPhone: 2131241), product: depositProduct, money: 200)

let clients2 = assembly.storagesAssembly.inMemory.get(key: "products_of_user_\(testclient1.id)")
if let clients2 = try? JSONDecoder().decode([Product].self, from: clients2!) {
    print(clients2)
}



let clients3 = assembly.storagesAssembly.inMemory.get

