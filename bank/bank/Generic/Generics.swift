
import Foundation

func printData<T: Codable>(key: String, type: T.Type) throws {
    let value: T = try assembly.storagesAssembly.inMemory.value(key: key)
    print(value)
}



// Generics почитать + порешать задачи
// EasyDI почитать
// CocoaPods почитать

// https://habr.com/ru/post/331710/ -





