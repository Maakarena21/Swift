import UIKit
import Foundation

///Кортеж
let myProgramStatus = (200, "In Work", true)
myProgramStatus // (.0 200, .1 "In Work", .2 true)

// объявляем кортеж с явно заданным типом
let floatStatus: (Float, String, Bool) = (200.2, "In Work", true)
floatStatus // (.0 200.2, .1 "In Work", .2 true)

// объявляем псевдоним для типа Int
typealias numberType = Int
// объявляем кортеж и инициализируем его значение
let numbersTuple: (Int, Int, numberType, numberType) = (0, 1, 2, 3)
numbersTuple // (.0 0, .1 1, .2 2, .3 3)

// записываем значения кортежа в переменные
let (statusCode, statusText, statusConnect) = myProgramStatus
// выводим информацию
print("Код ответа — \(statusCode)")
print("Текст ответа — \(statusText)")
print("Связь с сервером — \(statusConnect)")

/* объявляем две переменные с одновременной
инициализацией им значений */
var (myName, myAge) = ("Тролль", 140)
// выводим их значения
print("Мое имя \(myName), и мне \(myAge) лет")


/* получаем только необходимые
значения кортежа
let (statusCode, _, _) = myProgramStatus
 */

// выводим информацию с использованием индексов
print(" Код ответа — \(myProgramStatus.0)")
print(" Текст ответа — \(myProgramStatus.1)")
print(" Связь с сервером — \(myProgramStatus.2)")

let statusTuple = (statusCode: 300, statusText: "In Work", statusConnect: true)

// выводим информацию с использованием индексов
print("Код ответа — \(statusTuple.statusCode)")
print("Текст ответа — \(statusTuple.statusText)")
print("Связь с сервером — \(statusTuple.2)")

/* объявляем кортеж с
указанием имен элементов
в описании типа */
let anotherStatusTuple: (statusCode: Int, statusText: String, statusConnect: Bool)
= (200, "In Work", true)
// выводим значение элемента
anotherStatusTuple.statusCode // 200


var myFirstTuple: (Int, String) = (0, "0")
let mySecondTuple = (100, "Код")
// копируем значение одного кортежа в другой
myFirstTuple = mySecondTuple
myFirstTuple // (.0 100, .1 "Код")


(1, "alpha") < (2, "beta") // true
// истина, так как 1 меньше 2.
// вторая пара элементов не учитывается
(4, "beta") < (4, "gamma") // true
// истина, так как "beta" меньше "gamma".
(3.14, "pi") == (3.14, "pi") // true
// истина, так как все соответствующие элементы идентичны

var tupleThree = (9, "Age")
var tupleFour = (tupleThree.0, "9")

tupleThree = tupleFour

var kilometres : Double
var timePerSecond : Int

kilometres = 2.14
timePerSecond = 2

let metresPerMinute = (kilometres * 1000) / (Double(timePerSecond) / 60)

var int1 = 111
var int2 = 222
var strint = String(int1) + String(int2)
//var c = Int("\(int1)\(int2)")

print(strint)

var intX : Int8 = 127
var intY : UInt8 = 0

print(Int8.max)
print(UInt8.min)

var a: Int8 = Int8.min
var b: UInt8 = UInt8.max
//2
print(a)
print(b)


//4
var x = 1
var y: Int = 2
var z = 3

z = x
x = y
y = z

print("Значение x = \(x)")
print("Значение y = \(y)")

//5
let db : Float = 2.14
var bd : Double = 9.14

bd = 10.12

//6

let one = 18
let two : Float = 16.14
let three : Double = 6.25

let sum : Float = Float(one) + two + Float(three)
let mult = Int(Float(one)  * two * Float(three))
let res = Double(two.truncatingRemainder(dividingBy: Float(three)))


//7
var t = 2
var p = 3

var exp = (t + 4*p) * (t - 3*p) + (t*t)
print(exp)

//8
var c = 1.75
var d = 3.25

var result = 2*(c+1)*2+3*(d+1) //23.75
print(result)

type(of: result)
//9
let lenght : Double = 22
let S = lenght * lenght
let P = 2 * 3.14 * lenght

let SP = S * P

//10
var str = "blabla"
let chr : Character = "c"

var intCustom = 5
var intCustom1 = 4

var sum7 = "\(str)\(chr)\(intCustom + intCustom1)"
//11
print(
    """
        *   *   *
         * * * *
          *   *
        """)

print("*   *   *")
print(" * * * *")
print("  *   *")

//12
var day = 1
var month = "december"
var year = 1993
print("\(year) \(month) \(day)")
//13
var tr = true
var fls = false

tr || fls
tr && fls

// 14
( ( true && false ) || true )
true && false && true || ( true || false )
false || ( false || true ) && ( true && false )//15

//15
let myName1 = "Ivan"
var weight : Float = 86.9
var height = 193

var heightMetres = Float(height) / 100

var imt = weight / (heightMetres * heightMetres)

print("Мое имя - \(myName1), мой индекс массы - \(imt)")

//18
let a1 : Double = 2.14
let b1 : Double = 3.15

let average : Float = Float(a1 + b1) / 2

var tupleAboutMe = ("Mike", 37)
var (name, age) = tupleAboutMe
tupleAboutMe.0 = "Eridar"
print(name)
