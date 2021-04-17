
// Задача 1 - Two - Sum
//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//You can return the answer in any order.
import UIKit

func twoSum(array: [Int] , number: Int) -> [Int] { // функция принимает на вход массив целых чисел и число и возвращает массив
    for element in 0..<array.count { // цикл для индексов массива в диапазоне от 0 до последнего элемента массива
        for i in element + 1..<array.count { // цикл для индексов массива в диапазоне от element + 1 до конца массива
            if array[element] + array[i] == number { // условие если сумма элементов с данными индексами равна числу
                return [element,i] // возвращаем эти индексы
            }
        }
        
    }
    return [0 , 0] // если нет, то возвращаем 0
}

// Задача 2 - Reverse Integer
//Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

func reverseInteger(a: Int) -> Int { // функция принимает число и возвращает число
    var y = 0 // создаем переменную присваиваем 0
    var x = a // создаем переменную присваиваем а
    while x > 0 { // делаем цикл пока х больше 0
        y = y * 10 + x % 10 // в теле цикла у сдвиваем влево и добавляем последнюю цифру х (остаток от деления на 10)
        x = x / 10 // х сдвиваем вправо ( или делим на 10)
    }
    return y // возвращаем у
}
print(reverseInteger(a: 345)) // проверка

// Задача 3 - Remove Element
//Given an array nums and a value val, remove all instances of that value in-place and return the new length.
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//The order of elements can be changed. It doesn't matter what you leave beyond the new length.

func removeElement(_ nums: inout[Int] ,_ val: Int ) -> Int { // функция в которой массив передается по значению передается копия числа , возвращает число
    nums = nums.filter {$0 != val } // массив фильтруем по условию если элемент в массиве не равен числу
    return nums.count // возвращаем количество элементов массива
}
var array = [1,2,2,3,4] // пишем массив
print(removeElement(&array, 2)) // передаем массив и число
print(array) // проверка


// second decision, дополнительный массив.


func removeEl(_ nums: inout[Int] ,_ val: Int ) -> Int { // функция в которой массив передается по значению и передается копия числа , возвращает число
    nums.removeAll (where: {$0 == val}) // к массиву применяем свойство удалить все элементы которые равны val
    return nums.count // возвращаем размер массива
}
var arr = [1,2,2,3,4] // пишем массив
print(removeEl(&arr, 2)) // передаем массив и число
print(arr) // проверка


// Задача 4 - Best Time to Buy and Sell Stock
//You are given an array prices where prices[i] is the price of a given stock on the ith day.
//
//You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
//
//Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

func maxProfit(_ prices: [Int]) -> Int { // функция которая принимает на вход массив целых чисел и возвращает число
    var profit = 0 // создаем переменную и присваиваем 0
    for element in 0..<prices.count { // (день покупки) цикл для индексов массива в диапазоне от 0 до конца массива
        for i in element + 1..<prices.count { // (день продаж) цикл для индексов массива в диапазоне от element + 1 до конца массива
            let diff = prices[i] - prices[element] // создаем константу в которой присваиваем значение разницы цен между днем продаж и днем покупки
            if profit < diff { // условие в котором глобальная выгода меньше выгоды текущих значений массива
                profit = diff // глобальная выгода равна текущей выгоде
            }
        }
    }
    return profit // возвращаем глобальную выгоду
}
print(maxProfit([6,5,3,7])) // проверка


// Задача 5 -  Shuffle the Array
// Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

//Return the array in the form [x1,y1,x2,y2,...,xn,yn].

func shuffle(_ nums: [Int], _ n: Int) -> [Int] { // функция которая принимает на вход массив чисел и число , возвращает массив
    var array: [Int] = [] // переменная присваиваем пустой массив
    for element in 0..<n { // цикл для индексов массива в диапазоне от 0 до n (половины массива)
        
        array.append(nums[element]) // в пустой массив вставляем элемент с текущим индексом
        array.append(nums[element + n ]) // в пустой массив вставляем элемент с текущим индексом + половина массива
    }
    return array // возвращаем созданный массив
  }
print(shuffle([1,1,1,2,2,2], 3)) // проверка
