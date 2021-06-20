<<<<<<< HEAD
=======

>>>>>>> 4cb4a35c1ef63d07e22498b9d2e079b1e0a84295
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
<<<<<<< HEAD
// https://habr.com/ru/post/331710/ -
=======

// https://habr.com/ru/post/331710/ -


>>>>>>> 4cb4a35c1ef63d07e22498b9d2e079b1e0a84295
