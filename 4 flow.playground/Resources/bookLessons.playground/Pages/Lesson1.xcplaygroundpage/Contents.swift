import UIKit

var number1 = 9
var number2 = 4

//Арифметические опертаоры

number1 + number2
number1 - number2
number1 / number2
number1 * number2


//Оператор остатка от деления
number1 % number2
-number1 % number2
number1 % -number2

//Оператор присваивания

number1 = 10

number1 += 23
number1 -= 11
number1 /= 23
number1 *= 23


//Операторы сравнения

let a = 5
let b = 5

a == b
a != b
a > b
a < b
a >= b
a <= b


//Операторы диапозона

3...6 ~= 3 //тильда ну

...6 ~= 3 //от бесконечности
0... ~= 3 //до бесконечности

//Оператор логического НЕ

let accessDeniedMessage = "Access Denied"
let welcomeMessage = "Welcome"

let allowEntry = false

if !allowEntry {
    print(welcomeMessage)
}


//Оператор логического И

//человек ввел правильный код
let enteredDoorCode = true
//человек прошел проверку сечатки глаза
let passedRetinaScan = true
// айосник?
let isIOSDeveloper = true

if enteredDoorCode && passedRetinaScan && isIOSDeveloper{
    print("\(welcomeMessage) peace of shit")
}

//Оператор логического ИЛИ

// Есть ли ключ
let hasDoorkey = true

// Знает спецпароль
let knowOverridePassword = true

if hasDoorkey || knowOverridePassword{
    print("\(welcomeMessage) peace of human")
}


//Строки и символы

let name: String
let name1 = String()

"""
father
mother
daughter
"""

//Конкатенация строк

let text = "IOS " + "developer " + String(7)
print(text)

//Интерполяция строк

print("IOS Developer \(text)")
