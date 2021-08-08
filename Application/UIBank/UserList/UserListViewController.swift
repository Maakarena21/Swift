
import UIKit

struct PhoneFormatter {
    func format(phone: Phone) -> String {
        return "\(phone.countryCode) \(phone.numberPhone)"
    }
}


class UserListViewController: UITableViewController {
    var bank: Bank!
    var userRouter: UserRouter!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bank.users().count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = bank.users()[indexPath.row]
        cell.textLabel?.text = user.name + " " + user.secondName + " " + user.lastName
        let phoneFormatter = PhoneFormatter()
        cell.detailTextLabel?.text = phoneFormatter.format(phone: user.phone)
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = bank.users()[indexPath.row]
        userRouter.userDetails(user: user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}
