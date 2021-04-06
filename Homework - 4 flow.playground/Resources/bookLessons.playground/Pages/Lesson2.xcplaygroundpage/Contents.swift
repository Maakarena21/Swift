import UIKit


let age = 39

let permissionMessage : String

if age < 65 {
    permissionMessage = "Разрешено"
} else {
    permissionMessage = "Запрещено"
}



let permissionMesage = age < 65 ? "Разрешено" : "Запрещено"

print("Человека выходить \(permissionMesage)")


/// switch

let command = "left"

switch command {
case "up", "UP":
    print("go up")
case "down":
    print("go down")
case "right":
    print("go right")
default:
    print("error")
}

let command1 = -2

switch command1 {
case 1..<3:
    print("go down")
case 3...6:
    print("go up")
default:
    print("not enough")
}


/// Перечисления enum

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

let currentDay = Weekday.monday

let tommorowDay = Weekday.tuesday

enum Directions {
    case up
    case down
    case left
    case tight
}

enum Countries: Int {
    case usa = 1
    case russia = 2
    case china = 3
}

let country: Countries = .usa

let value = country.rawValue
print(value)


let dot = (3, 0)
switch dot {
case (0, 0): print("1")
case (_, 0): print("1")
case (0, _): print("1")
default: print("4")
}


var bikeVelocity: Double!
var carVelocity: Double! = 6
var planeVelocity: Double = 7

print(bikeVelocity + carVelocity + planeVelocity)

