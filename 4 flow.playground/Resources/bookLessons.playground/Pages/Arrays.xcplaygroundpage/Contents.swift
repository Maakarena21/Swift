import UIKit
import Foundation

//Массивы

//незименяяемый массив с элекментами типа String

let alpabetArray = ["a", "b", "c"]

//изменяемый массви с эедментами тип Int
var mytableArray = [2, 4, 6]

//создание массива с помощью Array(arrayLiteral:)
Array(arrayLiteral: 1, 1, 2, 3, 5, 6, 8)

let newAlphabetArray = Array(arrayLiteral: "a", "b", "c")

newAlphabetArray

Array(0...10)

// создание массива с помощью оператора диапазона

let lineArray = Array(0...9)
lineArray

// создание массива с повторяющимся значением

Array(repeating: "Ура", count: 3)

let repeatArray = Array(repeating: "Swift", count: 5)
repeatArray

// доступ к элементам массивов
alpabetArray[1]
lineArray[3]

// изменяем масссив
mytableArray[1] = 8
//вывод нового массива
mytableArray

//изменяемый массив
var stringsArray = ["one", "two", "three", "four"]
//заменим несколько массивов
stringsArray[1...2] = ["five"]
stringsArray
stringsArray[2]

// Массив с типом данных [String] или Array<String>
let firstAr = Array(arrayLiteral: "a", "b", "c")
type(of: firstAr)
//Массив с тиимпом данных [Int] или Array<Int>
let secondAr = Array(arrayLiteral: 1, 2 ,3)
type(of: secondAr)

//Полная/краткая форма записи типа массива
let thirdAr: [Int] = Array(1...3)
let arrayOne: Array<Character> = ["a", "b", "c"]

// исходный массив
let parentArray = ["one", "two", "three"]
//создаем копию массива
var copyParrent = parentArray
copyParrent
//изменяем значчение в копии массива
copyParrent[1] = "seven"
//выводим значение массивов
copyParrent
parentArray

//объявляем массив с пустым значением с помощью переданного значение
let emptyArray: [String] = []
//объявляем массив с помощью спецаильной функции
let anotherEmptyArray = [String]()

/* три константы, которые
 cтанут элементами массива */
let a1 = 1
let a2 = 2
let a3 = 3
var someArray = [1, 2 ,3]
someArray == [a1, a2, a3]

// создадим 3 массива

let charsOne = ["a", "b", "c"]
let charsTwo = ["d", "e", "f"]
let charsThree = ["g", "h", "i"]

// создаем новый слиянием двух
var alphabet = charsOne + charsTwo
//сливаем новый массив с третьим
alphabet += charsThree
print(alphabet)

//Многомерные массивы
var arrayOfArrays = [[1,2,3], [4,5,6], [7,8,9]]
//получаем вложенный масив
arrayOfArrays[2]
//получаем элемент вложенного массива
arrayOfArrays[2][1]

//Базовые свойства методов массивов
let someArray1 = [1,2,3,4,5]
someArray1.count

let someArray2 : [Int] = []
someArray2.isEmpty
someArray2.count


var numArray1 = [1,2,3,4,5]
//количество элементов в масисве
let sliceOfArray = numArray1[numArray1.count-3...numArray1.count-1]

let subArray = numArray1.suffix(3)

numArray1.first
numArray1.last

numArray1
numArray1.append(6)

numArray1
numArray1.insert(15, at: 3)

numArray1
numArray1.remove(at: 3)
numArray1.removeFirst()
numArray1.removeLast()
numArray1


numArray1
numArray1.dropLast()
let anotherNumArray1 = numArray1.dropFirst(3)
anotherNumArray1
numArray1

let resultTrue = numArray1.contains(4)
let resultFalse = numArray1.contains(10)

let randomArray = Array(1...9)
randomArray.min()
randomArray.max()

numArray1.reverse()

// исходная неотсортированная коллекция
var unsortedArray = [3, 2, 5, 22, 8, 1, 29]

//метод sorted() возврвщает отсортированную последовательность
// при этом ихсодный массив не изменяется

var sortedArray = unsortedArray.sorted()
unsortedArray
sortedArray

//метод sort() изменяет исходный массив
unsortedArray.sort()
unsortedArray

let moneyArray = [50, 100, 500, 1000, 10000]
let randomMoneyElement = moneyArray.randomElement()

let infArray = Array(0...1000)
let randomGeneratior = infArray.randomElement()

// исходный массив
let arrayOfNumbers = Array(1...10)
// его тип данных - Array<Int>
type(of: arrayOfNumbers)
arrayOfNumbers
// получим часть массива (подмассив)
let slice = arrayOfNumbers[4...6]
// его тип данных отличается от типа исходного массива
type(of: slice) // ArraySlice<Int>.Type

let arrayFromSlice = Array(slice)
type(of: arrayFromSlice)

// исходный массив
arrayOfNumbers // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// его срез, полученный в одном из предыдущих листингов
slice // [5, 6, 7]
// отдельный элемент
arrayOfNumbers[5] // 6
slice[5] // 6


var array3 = [1, 6, 8, 10]

array3.remove(at: 2)

array3[1] = array3[0] + array3[2]

array3.sort()

var arr = Array(1...100)

var arr2: Array<Int> = []

arr2 = Array(arr[24...49])


var array1: [ClosedRange<Character>] = ["a"..."e"]
