// 2 поток
//Задача 1 - Написать функцию с 2 целочисленными аргументы. Вернуть true, если первое делится без остатка на второе и false иначе
func numbers(number1: Int , number2: Int) -> Bool {
    if number1.truncatingRemainder(dividingBy: number2) == 0 {
        return true
    }
}

//Задача 2 - Написать функцию с 2 целочисленными аргументами. Вернуть наименьшее число из функции
func numbers(number1: Int , number2: Int) -> Int {
    if number1 < number2 {
        return number1
    } else {
        return number2
    }
}
//Задача 3 - Написать функцию с 2 целочисленными аргументами. Вернуть нечётный аргумент
import UIKit

func arguments(number1: Int , number2: Int) -> Int {
    if number1 % 2 != 0 {
        return number1
    } else if number2 % 2 != 0{
       return number2
    }
}

//Задача 4 - Написать функцию с 3 целочисленными аргументами. Вернуть наибольший аргумент
import UIKit

func arguments(number1: Int , number2: Int , number3: Int) -> Int {
    if number1 > number2 && number1 > number3 {
        return number1
    }
    if number2 > number1 && number2 > number3 {
        return Number2
    }
    if number3 > number1 && number3 > number2 {
        return number3
    }
    return 0
}
Arguments(number1: 10, number2: 5, number3: 3)
//Зачада 5 - На вход функции 3 числа - стороны требудеугольника. Во-первых, используя функцию существования треугольника, определить, существует ли он. Если существует - определить, какой он - равносторонний, равнобедренный или прост треугольник. Если он не существует из функции вернуть строчку “не существует”. А если да - один из типов “равносторонний”, “равнобедренный”, “прост треугольник”

import UIKit

func triangle(number1:Int , number2: Int , number3: Int) -> Bool {
    if number1 + number2 > number3 {
        return true
    } else if number2 + number3 > number1 {
        return true
    } else if number3 + number1 > number2 {
        return true
    } else {
    return false
    }
}
func isosceles(number1:Int , number2: Int , number3: Int) -> String {
    var str = ""
    if !triangle(number1:number1,number2:number2,number3:number3) {
        str = "Не существует"
    } else if number1 == number2  {
           str = "Треугольник Равнобедренный"
    } else if number1 == number2 && number1 == number3 {
           str = "Треугольник Равносторонний"
    } else {
        str = "Пусто"
    }
    return str
    }
print(isosceles(number1: 5, number2: 5, number3: 2))
//Задача 6 - Написать функцию по её математическому описанию:
//y = f(x), где y = 2x -10, если x > 0, y = 0, если x == 0, y = x*x - 4x +14, если x < 0
import UIKit

func f(x:Decimal){
    if x > 0 {
        print(2*x-10)
    } else if x == 0 {
        print(0)
    }
    print(pow(x, 2) - 4*x + 14)
}
// Задача 7 - На вход функции 2 целочисленных аргумента. Определить, к какой координатной четверти относится эта точка
func quadrant(x: Int, y: Int) -> String {
    if x > 0 && y > 0 {
        return("1 четверть")
    } else if x<0 && y>0 {
        return("2 четверть")
    } else if x < 0 && y < 0 {
        return("3 четверть")
    } else {
        return("4 четверть")
    }
}
// Задача 8 - На вход функции 1 целочисленный аргумент. Напечатать в консоль все НЕЧЕТНЫЕ числа, не превосходящие это число
import UIKit

func even(number1: Int){
    var t = 1
    while t <= number1 {
        print(t,terminator: ",")
        t = t+1
    }
}
even(number1: 98)
// 9 задача - На вход функции 2 целочисленных аргумента. Напечатать квадраты чисел, находящиеся между 1 и 2 аргументом. ( внимание! 1 аргумент должен быть больше 2-го )
func numbers(number1: Int, number2:Int) {
    if number1 < number2 {
        print("number1 < number2")
    } else {
        for i in number2+1...number1-1{
            print(i*i)
        }
    }
}
numbers(number1: 15, number2: 2)

// 10 задача - Факториал - произведение всех чисел от 1 до данного числа. Факториал обозначается символом “!” в математике. Так, 5! = 1*2*3*4*5 = 120. Написать функцию, которая в цикле вычисляет факториал входного аргумента.
func factorial(number1: Int) -> Void {
    var result = 1
    for i in 1...number1 {
         result *= i
    }
    print (result)
}
factorial(number1: 4)

// 11 задача - В сбер принесли X рублей на Y лет, годовых N процентов. С помощью цикла определить, сколько денег получит клиент через Y лет. X, Y, N - аргументы функции
func money(y:Float , x: Float , n: Int) -> Void {
    var t = x
    for i in 1...n {
        t = t + t * (y/100)
    }
    print(t)
}
money(y: 100, x: 12, n: 7)

// 12 задача - На вход функции массив целых чисел. Вернуть из функции новый массив нечетных чисел, входящих в массив из аргумента.
func array(number: [Int]) -> [Int] {
    var abc: [Int] = []
    for i in 0...number.count-1 {
        if number[i] % 2 != 0{
            abc.append(number[i])
        }
    }
    return abc
}
array(number: [1,2,3,4,5])

// 13 задача -
func func1(array: [Int]) -> Int {
    var t: Int = array[0]
    for i in array {
        if i >= t {
            t = i
        }
    }
    return t
}

func1(array: [1,5,7,10,-5])

func func2(array: [Int]) -> Int {
    var t: Int = array[0]
    for i in array {
        if i <= t {
            t = i
        }
    }
    return t
}

func2(array: [1,5,7,10,-5])


// 14 задача - Написать функцию, печатающую только двузначные числа из массива ( массив в аргументе )
func even(number1: Int){
    var t = 10
    while t <= number1 {
        print(t,terminator: ",")
        t = t+2
    }
}
even(number1: 100)
// Задача 15 - На вход функции - 2 числа. Вернуть true,  если только первое из них - чётное, а второе - кратно 7
func numbers(number1:Int , number2: Int) -> Bool {
    if number1 % 2 == 0 && number2 % 7 == 0 {
        return true
    } else {
        return false
    }
}
numbers(number1: 14, number2: 7)

//Задача 16 - На вход функции - 2 числа. Вернуть true, если оба числа чётные и кратны 78
func numbers(number1: Int , number2: Int) -> Bool {
    if number1 % 2 == 0 && number2 % 78 == 0{
        return true
    } else {
        return false
    }
}
numbers(number1: 156, number2: 78 )

//Задача 17 -
func months(months1:Int) -> Void {
    var m : [String] = ["January" , "February" , "March" , "April" , "May" , "June" , "July" , "August" , "September" , "October" , "November" , "December" ]
    if months1 == 1 {
        print(m[0])
    } else if months1 == 2 {
        print(m[1])
    } else if months1 == 3 {
        print(m[2])
    } else if months1 == 4 {
        print(m[3])
    } else if months1 == 5 {
        print(m[4])
    } else if months1 == 6 {
        print(m[5])
    } else if months1 == 7 {
        print(m[6])
    } else if months1 == 8 {
        print(m[7])
    } else if months1 == 9 {
        print(m[8])
    } else if months1 == 10 {
        print(m[9])
    } else if months1 == 11  {
        print(m[10])
    } else if months1 == 12 {
        print(m[11])
    }
}
months(months1: 1)

//Задача 18 = Написать функцию, возвращающую массив всех четных чисел, не превосходящих входной целочисленный аргумент
func array(number1 : Int) -> [Int] {// пишу функцию где присваиваю аргументу 1 значение инт и возвращаю целочисленный массив
    // называю переменную и присваиваю пустой массив
    var array1: [Int] = []
    // делаю цикл в диапазоне от 0 до аргумента, но не включая аргумент.Все числа будут меньше самого аргумента
    for i in 0..<number1 {
        // в теле цикла делаем условие , что если i(константу) делим на 2 без остатка == - это без остатка
        if i % 2 == 0 {
            // здесь я применяю свойство которое добавляет i - константу
            array1.append(i)
        }
    }
    return array1
}
array(number1: 10)




//Задача 19 = Написать функцию, печатающую в консоль элементы входного массива: двузначные и кратные 3
func array(number1: [Int]) -> Void { // пишу функцию где присваиваю аргументу 1 значение инт и не возвращаю ничего
    // называю переменную и присваиваю пустой массив
   var array1: [Int] = []
    // делаю цикл в котором я перебираю i внутри массива (все значения массива)
    for i in number1 {
        // условие в котором константу i делю на 3 и прописываю второе условие в котором указываю что i должно быть больше либо равно 10
        if i % 3 == 0 && i >= 10 && i <= 99 {
            print(i)
        }
   }
}
array(number1: [3,15,40,21])



//Задача 20 - На вход функции 1 аргумент - целое положительное число. Найти сумму всех нечетных чисел, меньше этого числа
func array(number1: Int) -> Int { // пишу функцию в которой указываю целочисленный аргумент
   // присваиваю переменной number2 = 0
    var number2 = 0
    // цикл в котором делаю перебор от 0 до входяшего числа в функции
    for i in 0..<number1 {
        // условие в теле цикла , где i(константу) делю на 2 неравное 0
       if i % 2 != 0 {
            // нахожу сумму того что нашли выше
           number2 += i
       }
   }
    // возвращаю number2
    return number2
}
array(number1: 10)
