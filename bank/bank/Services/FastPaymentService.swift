import Foundation

enum FastPaymentsError: Error{
    
}

protocol FastPaymentsService {
    func send(from: Phone, summ: Float, to: Phone) throws
}
class FastPaymentsServiceImpl: FastPaymentsService {
    
    
    var moneyService: MoneyService! // инъекция
    
    
    func send(from: Phone, summ: Float, to: Phone) throws {
     
<<<<<<< HEAD
        try moneyService.send(from: from, summ: summ)
=======
        try moneyService.send(from: from, summ: summ) 
>>>>>>> 4cb4a35c1ef63d07e22498b9d2e079b1e0a84295
        try moneyService.recieve(summ: summ, phone: to) // done
    }
    
    
}
