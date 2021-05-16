import UIKit
import Foundation

var intVar = 12

let rangeInt = 1..<3
let rangeInt1 = 1...3
type(of: rangeInt)
type(of: rangeInt1)

let rangeString = "a"..."z"
type(of: rangeString)

let rangeChar: Range<Character> = "a"..<"z"
type(of: rangeChar)

let rangeDouble = 1.0..<5.0
type(of: rangeDouble)

let firstElement = 10
let lastElement = 18

let myBestRange = firstElement..<lastElement

let myRange = ..<500
type(of: myRange)

let inRange = 2...

let collection = [1, 6, 76, 12, 51]
print(collection[inRange])

let IntR = 1...10
IntR.count

let floatR: ClosedRange<Float> = 1.0...2.0
floatR.contains(2.4)
// диапазон без элементов
let nullObj = 0..<0
nullObj.count
nullObj.isEmpty

// диапозон с 1 элементом
let nullObje = 0...0
nullObje.count
nullObje.isEmpty

let anotherRange = 12..<34
anotherRange.upperBound
anotherRange.lowerBound
anotherRange.min()
anotherRange.max()

let rangeOne = ...10
let rangeTwo = ..<10

let range = 1..<2

for i in range {
    print(i)
}

//Хешируемые
range.hashValue
anotherRange.hashValue

//Эквивалентные
range == anotherRange

//Сопоставимые, все диапозны являются не сопоставимыми
// range < anotherRange

let range3 = -100...100
var item: UInt = 21

var bool: Bool = range3.contains(Int(item))

var range4 = "A"..."Z"

range4.lowerBound
range4.upperBound

var range5 = Float(2.14)...3.15
type(of: range5)

var range6: ClosedRange<Float> = 2.14...3.16
type(of: range6)


let myName = "Ivan"
var myAge: UInt8 = 27

var hello: (name: String, age: Int)

hello.name = myName
hello.age = Int(myAge)

var turple: (Int16, Int16, Int16)

let (const1, const2) = (15, 17)

turple.0 = Int16(const1)
turple.1 = Int16(const2)
turple.2 = Int16(const1 + const2)

turple = (Int16(const1), Int16(const2), Int16(const1+const2))

print(turple)

var a = 12
var b = 21

(a, b) = (b, a)


var turpleX : (film: String, number: Int) = ("Batman", 777)

let (constX, constY) = turpleX

typealias Man = (film: String, number: Int)

var turpleY : Man = ("Robin", 888)

var bufTurple = turpleX

turpleX = turpleY

turpleY = bufTurple

var newTurple : (Int, Int, Int) = (turpleX.number, turpleY.number, turpleX.number - turpleY.number)
