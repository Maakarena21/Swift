//
//  UserStorage.swift
//  bank
//
//  Created by Silence on 19.05.2021.
//

import Foundation

protocol UserStorage {
    
    func users() -> [User]
    func add(user: User)
    
}

class UserStorageImpl: UserStorage {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func users() -> [User] {
        
        guard let usersData = storage.get(key: "clients") else {
            return []
        }
        
        do {
            let users = try JSONDecoder().decode([User].self, from: usersData)
            
            return users
            
        } catch {
            
            print("JSONDecoder error \(error)")
            
            return []
        }
    }
    
    func add(user: User) {
        guard let usersData = storage.get(key: "clients") else {
            let array = [user]
            
            do {
                let arrayData = try JSONEncoder().encode(array)
                storage.set(data: arrayData, key: "clients")
            } catch {
                print("JSONEncoder error \(error)")
            }
            return
        }
        
        do {
            var users = try JSONDecoder().decode([User].self, from: usersData)
            
            // убедиться, что юзера нету в этом массиве по идентификатору user.id
            
            for i in users {
                if user.id != i.id {
                    users.append(user)
                }
            }
            
            let usersData = try JSONEncoder().encode(users)
            storage.set(data: usersData, key: "clients")
            
        } catch {
            print("JSONDecoder error \(error)")
        }
    }
}
