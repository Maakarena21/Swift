//: [Previous](@previous)

import Foundation
import UIKit


// безымянная функция в качестве значения константы
let functionInLet = {return true}
functionInLet()

// массив с куплюрами
var wallet = [10,50,100,100,5000,100,50,50,500,100]
// функция отбора купюр

func handle100(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if banknote == 100 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

handle100(wallet: wallet)

func handleMore1000(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if banknote >= 1000 {
            returnWallet.append(banknote)
} }
    return returnWallet
}
// вызов функции отбора купюр с достоинством более или равно 1000
handleMore1000(wallet: wallet) // [5000]

// единая функция формирования реузльтирующего массива

func hadle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if closure(banknote) {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

// функция сравнения с числом 100
func compare100(banknote: Int) -> Bool {
    return banknote == 100
}

func compare1000(banknote: Int) -> Bool {
return banknote >= 1000
}

let resultWalletOne = hadle(wallet: wallet, closure: compare100)
let resultWalletTwo = hadle(wallet: wallet, closure: compare1000)



// отбор купюр достоинством выше 1000 рублей
// аналог передачи compareMore1000
hadle(wallet: wallet, closure: {(banknote: Int) -> Bool in return banknote >= 1000})

// отбор купюр достоинством 100 рублей
// аналог передачи compare100
hadle(wallet: wallet, closure: {(banknote: Int) -> Bool in return banknote == 100})


//Пропуск указания типов
hadle(wallet: wallet, closure: {banknote in return banknote >= 1000})

//Неявное указания типов
hadle(wallet: wallet, closure: {banknote in banknote >= 1000})

//Сокращенные имена параметров
hadle(wallet: wallet, closure: {$0>=1000})

// Вынос замыкания за скобки

hadle(wallet: wallet){ $0 >= 1000 }

hadle(wallet: wallet) {banknote in
    for number in Array(arrayLiteral: 100,500){
        if number == banknote {
            return true
        }
    }
    return false
}

let successBanknotes = hadle(wallet: wallet) {[100, 500].contains($0)}

successBanknotes

// Вынос нескоьких замыканий за скобки
func networkQuery(url: String, success: (String) -> (), error: (Int) -> ()) {
    
}
// Классический вариант
networkQuery(url: "weather.com", success: { data in }, error: {errorCode in})
// Новый вариант

networkQuery(url: "weather.com") { data in
    // ...
} error: { errorCode in
    // ...
}

// Безымянныу функции в параметрах

let closure: () -> Void = {
    print("Замыкающее выражение")
}

closure()

// передача в функцию строкового значения
let closurePrint: (String) -> Void = { text in
    print(text)
}

closurePrint("Text")

// передача в функцию целочисленных значений с осуществлением доступа через краткий синтаксис $0 $1

var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {
    $0 + $1
}

sum(10, 45)

// Пример использования замыканий при сортировке массива

let array = [1,44,81,4,277,50,101,51,8]

var sortedArrqay = array.sorted(by: {(first: Int, second: Int) -> Bool in return first < second})

sortedArrqay

sortedArrqay = array.sorted(by: {$0 < $1})

sortedArrqay

sortedArrqay = array.sorted(by: <)

sortedArrqay

// Захват переменных 13.6

var a = 1
var b = 2

let closureSum : () -> Int = {
    a + b
}

closureSum()
a = 3
b = 4
closureSum()

let closureSum2 : () -> Int = { [a, b] in a + b}

closureSum2()
a = 5
b = 8
closureSum2()

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return increment
}

var incrementBySeven = makeIncrement(forIncrement: 7)

incrementBySeven()
incrementBySeven()
incrementBySeven()


// Замыкания передаются по ссылке

var incrementByFive = makeIncrement(forIncrement: 5)
var copyIncrementByFice = incrementByFive

incrementByFive()
copyIncrementByFice()
incrementByFive()


// Автозамыкания

var arrayOfNames = ["Helga", "Bazil", "Alex"]
//func printName(nextName: String) {
//    print(nextName)
//}
//
//printName(nextName: arrayOfNames.remove(at: 0))

func printName(nextName: () -> String) {
    print(nextName())
}

printName(nextName: {arrayOfNames.remove(at: 0)})
