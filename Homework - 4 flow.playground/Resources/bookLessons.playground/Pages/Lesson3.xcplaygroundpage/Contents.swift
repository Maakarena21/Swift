import UIKit
import Foundation

var str = "Hello, playground"

var signedNhm: Int = -32
var unsignedNum: UInt = 128

let minInt = Int8.min

var count1 = 9 % 3

if count1 < 1 {
    print("hello dildo")
} else {
    print("fuck off")
}

var array = [10, 7, 9, 6]

array.max()

let firstFloat : Float = 3.14
let secondFloat : Float = 1.01
// метод truncatingReminder - для определения остатка от деления
let result1 = firstFloat.truncatingRemainder(dividingBy: secondFloat)
let result2 = -firstFloat.truncatingRemainder(dividingBy: secondFloat)
let result3 = -firstFloat.truncatingRemainder(dividingBy: -secondFloat)

var int1 = 3
// Для определения четности можно использовать специальный метод isMultiple(of:), применяемый к анализируемому числу.
int1.isMultiple(of: 3)

let numObj = Int.init(2)

let numberInt = 19
let numberDouble = 3.13
let resD = Double(numberInt) + numberDouble
let resI = numberInt - Int(numberDouble)

// переменная типа Int
var count = 19
// прибавим к ней произвольное число
count += 5 // 24
/* эта операция аналогична выражению
count = count + 5 */
// умножим его на число 3
count *= 3 // 72
/* эта операция аналогична выражению
count = count * 3 */
// вычтем из него число 3
count -= 3 // 69
/* эта операция аналогична выражению
count = count - 3 */
// найдем остаток от деления на 8
count %= 8 // 5
/* эта операция аналогична выражению
count = count % 8 */

// 17 в десятичном виде
let decimalInteger = 17
// 17 в двоичном виде
let binaryInteger = 0b10001
// 17 в восьмеричном виде
let octalInteger = 0o21
// 17 в шестнадцатеричном виде
let hexadecimalInteger = 0x11


let number = 1_000_000 // 1000000
let nextNumber = 1000000 // 1000000

var myWallet: Double = 0
let incomeAfterOperation: Double = 0.1

myWallet += incomeAfterOperation
print(myWallet)
myWallet += incomeAfterOperation
print(myWallet)
myWallet += incomeAfterOperation
print(myWallet)
//Decimal жрет много оперативы, но необходим когда требуются точные вычисления (например с финансами)
var decimalWallet : Decimal = 0
let income : Decimal = 0.1
decimalWallet += income
print(decimalWallet)
decimalWallet += income
print(decimalWallet)
decimalWallet += income
print(decimalWallet)

let char: Character = "a"
print(char)

// константа типа String
// тип данных задается явно
let stringOne: String = "Dragon"

// с помощью пустого строкового литерала
var emptyString = ""
// с помощью инициализатора типа String
var anotherEmptyString = String()

//открывающие и закрывающие тройки кавычек должны находиться на строке, не содержащей текст литерала:
      // корректно
      """
      строковый_литерал
      """
//закрывающая тройка кавычек должна находиться в одном столбце или левее, чем текст:
      // некорректно
      // у нижних кавычек есть отступ


let longString = """
    Это многострочный
    строковый литерал
    """


// переменная типа String
let name = "Дракон"
// константа типа String c использованием интерполяции
let hello = "Привет, меня зовут \(name)!"
// интерполяция с использованием выражения
let meters: Double = 10
let text = "Моя длина \(meters * 3.28) фута"
// выведем значения на консоль
print(hello)
print(text)


// константа типа String
let firstText = "Мой вес"
// переменная типа Double
let weight = 12.4
// константа типа String
let secondText = "тонны"
// конкатенация строк при инициализации значения новой переменной
let resultText = "\(firstText) \(String(weight)) \(secondText)"
print(resultText)


let firstString = "Swift"
let secondString = "Objective-C"
let anotherString = "Swift"
firstString == secondString // false
firstString == anotherString // true

let myCharOverUnicode: Character = "\u{041A}"
myCharOverUnicode // К


let stringOverUnicode = "\u{41C}\u{438}\u{440}\u{20}\u{412}\u{430}\u{43C}\u{21}"
stringOverUnicode // "Мир Вам!"

// константа с неявно заданным логическим типом
let isDragon = true
// константа с явно заданным логическим типом
let isKnight: Bool = false

// логическая переменная
// var isDragon = true
// конструкция условия
if isDragon {
    print("Привет, Дракон!")
} else {
    print("Привет, Тролль!")
}

//Логические операторы !(Не) &&(И) || (ИЛИ)

let someBool = true
// инвертируем значение
!someBool // false
someBool // true

let firstBool = true, secondBool = true, thirdBool = false
// группируем различные условия
let one = firstBool && secondBool // true
let two = firstBool && thirdBool // false
let three = firstBool && secondBool && thirdBool // false

let firstBool1 = true, secondBool1 = false, thirdBool1 = false
// группируем различные условия
let one1 = firstBool1 || secondBool1   // true
let two1 = firstBool1 || thirdBool1    // true
let three1 = secondBool1 || thirdBool1 // false

let resultBool = firstBool && (secondBool || thirdBool) // true
let resultAnotherBool = (secondBool || (firstBool && thirdBool)) //true

// Утверждение "1 больше 2"
1 > 2 // false
// вернет false, так как оно ложно
// Утверждение "2 не равно 2"
2 != 2 // false
// вернет false, так как оно ложно
// Утверждение "1 плюс 1 меньше 3"
(1+1) < 3 // true
// вернет true, так как оно истинно
// Утверждение "5 больше или равно 1"
5 >= 1 //  true
// вернет true, так как оно истинно

// определяем псевдоним для типа UInt8
typealias AgeType = UInt8
/* создаем переменную типа UInt8,
используя псевдоним */
var myAge: AgeType = 29

// определяем псевдоним для типа String
typealias TextType = String
typealias WordType = String
typealias CharType = String
// создаем константы каждого типа
let someText: TextType = "Это текст"
let someWord: WordType = "Слово"
let someChar: CharType = "Б"
let someString: String = "Строка типа String"


let maxAge = AgeType.max

let someThing = 5.14
/// 1 способ зажать option и навести на переменную, другой способ узнать тип данных — функция type(of:)
print(type(of: someThing))

let stringForHash = "Строка текста"
let intForHash = 23
let boolForHash = false

stringForHash.hashValue // 109231433150392402
intForHash.hashValue // 5900170382727681744
boolForHash.hashValue // 820153108557431465
