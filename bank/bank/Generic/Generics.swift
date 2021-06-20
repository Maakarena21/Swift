
import Foundation

func printData<T: Decodable>(key: String, type: T.Type) {
    guard let data = assembly.storagesAssembly.inMemory.get(key: key) else { return }
    if let dataResult = try? JSONDecoder().decode(T.self, from: data) {
        print(dataResult)
    }
}



// Generics почитать + порешать задачи
// EasyDI почитать
// CocoaPods почитать

// https://habr.com/ru/post/331710/ -


