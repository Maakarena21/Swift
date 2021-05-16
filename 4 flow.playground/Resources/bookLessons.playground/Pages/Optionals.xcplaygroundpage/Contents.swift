//: [Previous](@previous)

import Foundation

// Опционалы

let possibleString = "1985"
let converPossibleString = Int(possibleString)

let unpossibleString = "Одна тысяча сто пять"
let convertUnpossibleString = Int(unpossibleString)

let x1 = Int("12")
type(of: x1) // Optional<Int>.Type
    
let x2 = Int(43.2)
type(of: x2) // Int.Type


let optionalChar: Optional<Character> = "a"

var xCoordinate: Int? = 12

var someOptional: Bool?

var optionalVar = Optional("StringValue")

optionalVar = nil

type(of:optionalVar)


// Опционалы в кортежах
var tuple: (code: Int, message: String)? = nil

tuple = (404, "Page not found")

let tupleWithoptelements: (Int?, Int) = (nil, 100)

tupleWithoptelements.0
tupleWithoptelements.1

// Извлечение опционального знаечния

let a: Int = 4
let b: Int? = 5

// a+b Ошбика тк разныет ипы

/*
 3 основных типа извлечения:
 - принудительное извлченеие
 - косвенное извлечение
 - операция объежинения с nil
 */

// Принудительное (!)

var optVar: Int? = 32
var intVar = 34
let result = optVar! + intVar

type(of: optVar!)

let optString: String? = "Vasiliy Usov"
let unwrapperstring = optString!
print("My name is \(unwrapperstring)")

// Косвенное извлечение значения

var wrapInt: Double! = 3.14

wrapInt + 0.12

// Проверка наличия знаечния в опционале

let optOne: UInt? = nil
let optTwo: UInt? = 32

optOne != nil
optTwo != nil

var fiveMarkCount: Int? = 8
var allCakesCount = 0
if fiveMarkCount != nil {
    let cakeForEachFiveMark = 2
    allCakesCount = cakeForEachFiveMark * fiveMarkCount!
}

allCakesCount

// Опциональное связывания

var userLogin: String? = "Vasya"

if let userName = userLogin {
    print("Имя, \(userName)")
} else {
    print("Имя не введено")
}

type(of: userLogin)

let markCount: Int? = 8
// определение наличия значения
if let marks = markCount {
    print("Всего \(marks) оценок")
}

var pointX: Int? = 5
var pointY: Int? = 9

if let _ = pointX, let _ = pointY {
    print("Точка установлена на плоскости")
}

if let x = pointX, x > 3 {
    print("Точка даленко от вас")
}

// Опциональное связывание как часть оптимизации кода

let coinsInNewChest = "140"
var allCoinsCount = 1408
if Int(coinsInNewChest) != nil {
    allCoinsCount += Int(coinsInNewChest)!
} else {
    print("У нового дракона отсутствует золото")
}

var coins = Int(coinsInNewChest)

if coins != nil {
    allCoinsCount += coins!
} else {
    print("У нового дракона отсутсвтует золото")
}

if let coins = Int(coinsInNewChest) {
    allCoinsCount += coins
} else {
    print("У нового дракона отсутствует золото")
}

// Оператор объединения с nil ??

let optionalInt: Int? = nil
var mustHaveResult = optionalInt ?? 5

let optionalInt1: Int? = 20
var mustHaveResult1: Int = 0

if let unwrapped = optionalInt1 {
    mustHaveResult1 = unwrapped
} else {
    mustHaveResult1 = 0
}

