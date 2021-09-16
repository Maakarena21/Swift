

import Foundation
import Combine

typealias CurrencyCode = String

enum RateServiceError: Error {
    case networkError(Error)
    case internalError
}

protocol RateService {
    func load(from: CurrencyCode, to: CurrencyCode) -> AnyPublisher<[CurrencyCode: Double], RateServiceError>
}

class RateServiceImpl: RateService {
    func load(from: CurrencyCode, to: CurrencyCode) -> AnyPublisher<[CurrencyCode: Double], RateServiceError>{
        let apiKey = "d35da912fd33265b1e6b"
guard let url = URL(string: "https://free.currconv.com/api/v7/convert?q=\(from)_\(to)&compact=ultra&apiKey=\(apiKey)") else { return Future { $0(.failure(RateServiceError.internalError)) }.eraseToAnyPublisher()
            
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> [CurrencyCode : Double ] in
                try JSONDecoder().decode([CurrencyCode : Double ].self, from: data)
            }
            .mapError {
                .networkError($0)
            }
            .eraseToAnyPublisher()
        
    }

}
