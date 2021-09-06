
import UIKit

struct UserClientInfo {
    let fullName: String
}


struct UserListState {
    let clients: [UserClientInfo]
}

protocol UserListView: AnyObject {
    var currentState: UserListState? {get set}
}

class UserListViewController: UITableViewController, UserListView {
    
    var currentState: UserListState? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    var bank: Bank!
    var userRouter: UserRouter!
    var user: User!
    var presenter: UserListPresenter!
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentState?.clients.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = currentState?.clients[indexPath.row].fullName
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellTapped(indexPath: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        presenter.viewLoaded()
        view.backgroundColor = .white
    }
}
