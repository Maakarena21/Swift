// 1 поток
//Задача 1 - Даны 2 целых числа в качестве аргументов функции. Сложить остатки от деления этих аргументов на 5 и вернуть результат
import UIKit

func twoIntegers (arg1: Double , arg2: Double ) -> Double  {
    let result1 = arg1 / 5
    let result2 = arg2 / 5

    return result1 + result2
}
twoIntegers(arg1: 20, arg2: 15)


// Задача 2 -Даны 2 числа на вход функции.
// Первое - количество проголосовавших за патриотического кандидата ( Int ), второе - результат на выборах его в процентах (Double) ( сколько процентов от пришедших за него отдало голос ).
// Определить, сколько человек проголосовало на выборах.
 import UIKit

func golos(arg1: Int , arg2: Double) -> Int {
    let r = Double(arg1) / arg2
    let z = r * 100
    return Int(z)
}
golos(arg1: 88, arg2: 13)

// Задача 3 - Функция принимает на вход 3 аргумента - часы, минуты, секунды ( все Int ). Вернуть число секунд
import UIKit

func time(hours: Int, minute: Int, seconds: Int) -> Int {
    let Interval1 = hours * 60 * 60
    let Interval2 = minute * 60
    let Interval3 = seconds
    return Interval1 + Interval2 + Interval3
}
time(hours: 1, minute: 50, seconds: 2)

// Задача 4 - Написать 2 функции. Обе принимают на вход 2 аргумента - длина и ширина прямоугольника.
//Но первая возвращает его периметр, вторая - площадь. Все в целых числах ( Int )

import UIKit

func decision(length: Int , width: Int) -> Int {
    let perimetr = (length + width) * 2
    return perimetr
}
decision(length: 20, width: 10)

func square(legth: Int, width: Int) -> Int {
    let s = legth * width
    return s
}
square(legth: 20, width: 10)


// Задача 5 - Функция принимает на вход 2 аргумента. Первый - объем бутылки ( в долях от литра - 0.5, 0.7 и т д ),
//второй - крепость напитка ( десятичная дробь, все аргументы - Double). Вычислить количество выпитого чистого спирта в граммах ( миллилитры)
import UIKit

func V(volume: Float, fortress: Double) -> Float {
    let decision1 = volume * 1000
    let decision2 = decision1 / 100 * 95

    return decision2

}
v(volume: 0.5, fortress: 95)

// Задача 6 - Есть уравнение x2 + 3x-44 = 0 Написать функцию, печатающую оба корня квадратного уравнения.Тут надо загуглить дискриминант и как корни уравнения вычислять. Используйте функцию sqrt() для вычисления квадратного корня.
//Коэффициенты квадратного уравнения ( множители перед x2, x и свободный член -44) передавайте в качестве аргументов в функцию.
import Foundation
import UIKit

func discriminant(number1: Double , number2: Double , number3: Double) -> [Double] {
    let discr = 2 * number2 - 4 * number1 * number3
    var koren1 = 0.0
    var koren2 = 0.0
        if discr >= 0 {
        koren1 = (-number2 + sqrt(discr)) / (2 * number1)
        koren2 = (-number2 - sqrt(discr)) / (2 * number1)
}
    return [koren1, koren2]
}
print(discriminant(number1: 2 , number2: 3 , number3: -44))

// Задача 7 - Написать функцию, принимающую в качестве аргументов длину катетов прямоугольного треугольника. Функция должна нарисовать в консоли треугольник из звёздоздочек
import UIKit

var rectangle: Int = 5
for i in stride(from: rectangle, through: 0, by: -1) {
    for _ in i...rectangle{
        print("*",terminator: "")
    }
    print("")
}

//
// Задача 8 - Написать функцию, вычисляющую длину окружности. Радиус на вход в качестве аргумента ( Double ).
//На выходе - длина окружности. Число пи так писать Double.pi .
import UIKit

func radius(r:Double) -> Double {
    let f = 2 * r * 3.14
    return f
}

// Задача 9 - Написать функцию, принимающую на вход аргумент - длина стороны квадрата. Найти радиус вписанной окружности ( радиус вписанной в квадрат окружности - половина его стороны - нарисуйте и проверьте на бумажке) и вызвать функцию из п.8.
//Результат длины окружности вернуть из функции.
import UIKit

func radius(a:Double) -> Double {
    let f = 2 * a * 3.14
    return f
}
//Задача 10 - Написать функцию, определяющую площадь круга по его радиусу ( то же, что в п.8, но площадь - загуглите формулу )
import UIKit

func s(radius: Double) -> Double {
    3.14 * pow(radius, 2)

}
// Задача 11 - Написать функцию, принимающую на вход объём бутылки, крепость напитка и количество бутылок, выпитых на вечеринке. Используя функцию из п. 4 определить суммарный объем выпитого.
//( функцию из п.4 обязательно нужно вызвать)
import UIKit

func v(volume: Float, fortress: Double) -> Float {
    let decision1 = volume * 1000
    let decision2 = decision1 / 100 * 95

    return decision2

}
func party(volume:Float, krepost: Double , kolichestvo: Float) -> Float {
   let k = v(volume:volume , fortress: krepost)
    return Float(kolichestvo) * k
}

// Задача 12 - И функцию, по стороне квадрата вычисляющую площадь вписанного круга ( аналогично п. 9 )
import UIKit

func s(dlina: Double) -> Double {
    let r = dlina / 2
    let p = 3.14 * pow(r, 2)
    return p
}
s(dlina: 10)



// Задача 13 - Используем встроенную sqrt(). Написать функцию, по двум катетам прямоугольного треугольника возвращающую гипотенузу
import UIKit

func treugolnik(cathet1: Double, cathet2: Double) -> Double{
    let gipotenuza = sqrt(cathet1 * cathet1 + cathet2 * cathet2)
    return gipotenuza
}
treugolnik(cathet1: 5, cathet2: 7)
