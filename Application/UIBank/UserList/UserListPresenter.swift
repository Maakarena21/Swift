

import Foundation


protocol UserListPresenter {
    func cellTapped(indexPath: IndexPath)
    func viewLoaded()
}

class UserListPresenterImpl: UserListPresenter {
   
    
    var user: User!
    var userRouter: UserRouter!
    var bank: Bank!
    var view: UserListView?
    
    func cellTapped(indexPath: IndexPath) {
        let user = bank.users()[indexPath.row]
        userRouter.userDetails(user: user)
    }
    
    func viewLoaded() {
        let users = bank.users()
        view?.currentState = UserListState(clients: users.map{ UserClientInfo(fullName: $0.name + " " + $0.lastName )})
    }
    
}
