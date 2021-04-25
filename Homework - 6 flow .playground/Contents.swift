
// Задача 1 - Есть структура Документ. У него id, текст, дата ( Date() ) помещения на подпись, дата подписания и флаг isSigned: Bool;
//Есть структура Sap , которая принимает на вход массив документов. У Sap есть метод "подписать", принимающий на вход идентификатор документа на подпись. Метод ищет нужный документ по идентификатору и ставит ему дату подписания, ставя isSigned = true. Нужно написать у Sap 2 метода - получение подписанных документов и получение неподписанных документов

import Foundation
var count = 0 // создаем глобальную переменную(переменная которая считает количество документов)
struct Doc { // создаем структуру Doc
  let id: Int // создаем константу id присваиваем Int
  var text: String // создаем переменную text присваиваем String
  let date = Date() // создаем константу date и присваиваем встроенную функцию Date() (записывает текущую дату)
  var dateSigned: Date // создаем переменную dateSigned и присваиваем тип Date
  var isSigned: Bool //  создаем переменную isSigned и присваиваем Bool
  init (text:String = "Default text", dateSigned:Date = Date(), isSigned:Bool = false) { // инициализация стуктуры Doc, на вход принимает строку со значением по умолчанию (дефолтный текст), дату подписи со значением по умолчанию текущей даты, булевую переменную со значением по умолчанию false
    
    self.id = count // id структры присваиваем значение count
    count = count + 1 // счетчик документов увеличиваем на + 1
    self.text = text // тексту документа присваиваем text из аргумента функции
    self.dateSigned = dateSigned // дате подписания присваиваем dateSigned из аргумента функции
    self.isSigned = isSigned // булевую переменную присваиваем isSigned из аргумента функции
  }
  mutating func sign() { // пишем изменяющую функцию которая не принимает на вход ничего
    self.isSigned = true // присваиваем булевой переменной true
    self.dateSigned = Date() // присваиваем дате подписанию текущую дату
  }
}
 
struct Sap { // создаем структуру
  let array: [Doc] // константе присваиваем массив документов
  func sign(id: Int) { // пишем функцию подписи документа который принимает на вход id документа
      for var currentDoc in self.array { // цикл для каждого документа в массиве документов
          if !currentDoc.isSigned && currentDoc.id == id { // пишем условие если не подписанный документ и если айди документа совпадет с id на входе
             currentDoc.sign() // то документ подписываем, вызываем мутированную функцию структуры Doc
          }
      }
  }
  func signed() -> [Doc] { // пишем функцию вывода массива подписанных документов
     return self.array.filter {$0.isSigned} // возвращаем отфильтрованный массив по условию если переменная внутри документа принимает значение true
  }
  func unsigned() -> [Doc] { // пишем функцию вывода массива неподписанных документов
     return self.array.filter {!$0.isSigned} // возвращаем отфильтрованный массив по условию если переменная внутри документа принимает значение false
  }
}
var docs: [Doc] = [Doc(), Doc(isSigned: true)] // создаем массив документов с тремя элементами, 1 - документ создается с дефолтными значениями, а 2 - документ - подписанный с логическим значением true
var kek = Sap(array: docs) // создаем переменную структуры Sap, в которой массив документов
print(kek.signed()) // подписанные документы
print(kek.unsigned()) // неподписанные


// 2 задача - Структра вклад. У нее 2 поля - количество рублей и количество копеек. Определить руками init(), в который передаются рубли и копейки. Внимание - копеек можно передать любое количество, потому если там больше 100, количество рублей увеличиваем.
//Структура банк;
//
//- метод завести вклад - передаем туда вклад
//- метод добавить бабки на вклад - к текущему вкладу добавляем еще вклад ( определить правила суммирования вкладов так, как мы делали с дробями )
//- метод, вычисляющий размер вклада через n лет при m процентов годовых ( m, n - аргументы метода )
//- у вклада написать метод print(), который печатает красиво вклад - 10000 руб. 34 коп.

struct Deposit { // создаем структуру Депозит
    var pounds: UInt // создаем переменную рубли
    var pence: UInt // создаем переменную копейки
    init( pounds: UInt = 0, pence: UInt = 0) { // инициализация принимает на вход рубли и копейки с дефолтным значением 0
        self.pence = pence % 100 // присваиваем внутри структуры копейки остаток от деления копеек на 100
        self.pounds = pounds + pence / 100 // присваиваем рублям сумм рублей + копеек деленных на 100 без остатка
    }
}
    let staff = Deposit(pounds: 23, pence: 1243) // создаем константу и присваиваем ей депозит который принимает на вход рубли и копейки
    print(staff)
struct Bank { // создаем структуру Bank
    var deposit: Deposit // создаем переменную deposit типа Deposit
    init(pounds: UInt = 0,pence: UInt = 0) { // инициализатор принимает на вход рубли и копейки с дефолтным значением 0
        self.deposit = Deposit(pounds: pounds, pence: pence) // cоздаем депозит с рублями и копейками из аргументов функции и присваиваем вкладу внутри структуры банка
    }
    mutating func deposit(deposit: Deposit) { // пишем мутированную функцию которая изменяет структуру банка и принимает на вход депозит
        self.deposit.pounds = self.deposit.pounds + deposit.pounds + (self.deposit.pence + deposit.pence) / 100 // присваиваем значение рублей вклада в банке равное сумме рублей вклада в банке и рублой вклада из аргументов и копейки из банка + копейки из аргумента деленое на 100 без остатка
        self.deposit.pence = (self.deposit.pence + deposit.pence) % 100 // присваиваем значения рублей вклада в банке равное остатку от деления на 100 суммы суммы из вклада из банка и аргумента функции
    }
    func futureDep (years: Float, percent: Float) { // пишем функцию расчет депозита которая принимает на вход количество лет и процентов
            let ppence = Int(Float(deposit.pounds * 100 + deposit.pence) * pow(percent/100 + 1, years) )
            // создаем константу, которое записываем количество копеек, умноженное на процент в степени лет
            print("Счет через \(years) лет при \(percent) процентов годовых: \(ppence / 100) руб. \(ppence%100) коп.") // выводим в консоль количество рублей и копеек
        }
    func printDep() { // пишем функцию которая ничего не принимает (вывод вклада)
        print("Текущий счет: \(self.deposit.pounds) руб. \(self.deposit.pence) коп.") // выводим в консоль текущий счет в рублях и копейках
    }
}
var taff = Bank(pounds: 35, pence: 143) // создаем переменную типа Bank которая принимает на вход вклад в рублях и копейках
taff.deposit(deposit: staff) // добавляет текущему вкладу , вклад staff
taff.printDep() // вывод получевшегося вклада после суммирования
taff.futureDep(years: 2, percent: 50) // расчет депозита через 1 год и 100 процентов





// Задача 3 - Пускай есть класс Фабрика. И ее продукция - классы стол, стул и диван. Фабрика имеет метод createProduct и он принимает на вход строку - «chair”, “table”,  “sofa” (или enum).  Внутри она имеет 3 свойства -  массив столов, массив стульев и массив диванов и добавляет туда соотвествующую структуру, исходя из строки в аргументе метода createProduct

class Sofa { // создаем класс Sofa
}
 
class Chair { // создаем класс Chair
}
 
class Table { // создаем класс Table
}
 
 
class Factory {
    var chair = [Chair]() // создаем переменную и присваиваем пустой массива типа Chair
    var table = [Table]() // создаем переменную и присваиваем пустой массива типа Table
    var sofa = [Sofa]() //  создаем переменную и присваиваем пустой массива типа Sofa
 
    func createProduct(product: String) { // создаем функцию createProduct которая принимает на вход строку с названием product
        if product == "chair" { // если product равен chair
            chair.append(Chair()) // добавляем в массив структуру Chair
        } else if product == "table" { // если product равен table
            table.append(Table()) // добавляем в массив структуру Table
        } else if product == "sofa" { // если product равен sofa
            sofa.append(Sofa()) // добавляем в массив структуру Sofa
        }
    }
}
var factory = Factory() // создаем переменную factory присваиваем класс Facrory
factory.createProduct(product: "chair") // обращаемся к factory и вызывваем функцию createProduct
print(factory.chair) // выводим в консоль



// Задача 4 -
//1. Класс "папка". В ней массив файлов.
//2. Класс файл - имеет 2 свойства - имя и текст внутри
//3. Класс "директория" имеет 2 массива - массив файлов и массив папок
//4. У директории написать метод, принимающий на вход имя файла и печатающий текст файла


class Folder { // создаём класс папка
    var folder = [File]() // создаем переменную папка в ней массив файлов
}

class Directory { // создаем класс директория
    var file = [File]() // создаем переменную файл в ней массив файлов
    var ffolder = [Folder]() // создаем переменную папка в ней массив папок
    func secondName(name: String ) {
        for f in file { // цикл перебор всего массива
            if f.name == name { // если какой-то элемент в массиве с именем файла равен name
                print(f.text) // выводим в консоль текст
            }
        }
    }
}
class File { // создаем класс файл
    var text: String // переменная text с типом String
    var name: String // переменная name с типом String
    init(text: String , name: String) { // инициализируем text и name
        self.name = name // присваиваем при
        self.text = text // прис
    }
}
var eff = File(text: "KY-KY", name: "File") // создаем переменную присваиваем класс File
var keff = Directory() // создаем переменную присваиваем класс директорию
keff.file.append(eff) // вставляем в директорию файл
keff.secondName(name: "File") // вызываем функцию secondName


/* USER DEFAULTS Storage (UserDefaults.standard),
   FILE STORAGE Storage (FileManager) используйте ключ в качестве имени файла
   Keychain Storage (KeychainAccess)
 */

struct User: Codable {
    let id: String
    let name: String
    let avatar: URL
}

protocol Storage {
    func set(data: Data, key: String)
    func getData(key: String) -> Data?
}

class UserDef: Storage { //
    var user = UserDefaults.standard
    
    func set(data: Data, key: String) {
        user.set(data, forKey: key)
    }
    func getData(key: String) -> Data? {
        return user.data(forKey: key)
    }
}

//File manager
class FileManag: Storage {
    var val = FileManager.default
    
    func set(data: Data, key: String) {
        val.createFile(atPath: key, contents: data)
    }
    func getData(key: String) -> Data? {
        return val.contents(atPath: key)
        
    }
}

// Dictionary - InMemoryStorage
class InMemoryStorage: Storage {
    var dictionary: [String: Data] = [:]

    func set(data: Data, key: String) {
        dictionary[key] = data
    }
    
    func getData(key: String) -> Data? {
        return dictionary[key]
    }
}

class StoragesAssembly {
    var inMemory: Storage {
        return InMemoryStorage()
    }
    
    var userDefaults: Storage {
        return UserDef()
    }
    
    var filesystemStorage: Storage {
        return FileManag()
    }
}


let assembly = StoragesAssembly()
let storage = assembly.inMemory


let userToStore = User(id: "wefwefewf", name: "wefwewef", avatar: URL(string: "sefwrgf")!)
let userData1 = try! JSONEncoder().encode(userToStore)

storage.set(data: userData, key: "test_user_key")

if let userData2 = storage.getData(key: "test_user_key") {
    let userFromStorage = try! JSONDecoder().decode(User.self, from: userData2)
    print("userFromStorage - \(userFromStorage)")
}

let storage3 = assembly.userDefaults
storage3.set(data: userData1, key: "test_key")
if let userData3 = storage3.getData(key: "test_key") {
    let userFromStorage2 = try! JSONDecoder().decode(User.self, from: userData3)
    print("UserDefaults - \(userFromStorage2)")
}

let storage4 = assembly.filesystemStorage
storage4.set(data: userData1, key: "test_taff")
    if let userData4 = storage4.getData(key: "test_taff") {
        let userFromStorage4 = try! JSONDecoder().decode(User.self, from: userData4)
        print("FileManager - \(userFromStorage4)")
    }



