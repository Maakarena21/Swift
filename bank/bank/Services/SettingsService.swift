

import Foundation

struct ProductPreferences: Codable {
    let productReceiverId: String
    let productSenderId: String
}

protocol PreferencesService {
    func getPreferences(user: User) -> ProductPreferences?
    func set(preferences: ProductPreferences, user: User)
}

class PreferencesServiceImpl: PreferencesService {
     var storage: Storage! // инъекция через свойство
    
    func getPreferences(user: User) -> ProductPreferences? {
         
        do {
            let preferencesData = try storage.get(key: "preferences_id_\(user.id)")
            let preferences = try JSONDecoder().decode(
                ProductPreferences.self, from: preferencesData)
            return preferences
        }
        catch {
            print("JSONDecoder error\(error)")
            return nil
        }
    }
    
    func set(preferences: ProductPreferences, user: User) {
        do {
            let preferencesData = try JSONEncoder().encode(preferences)
            storage.set(data: preferencesData, key: "preferences_id_\(user.id)")
        }
        catch {
            print("JSONEncoder error\(error)")
        }
    }
}
