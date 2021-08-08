import UIKit


struct ProductFormatter {
    func format(product: Product) -> String {
        switch product.type {
        case let .credit(credit):
            return "Кредит - \(credit.summ)"
        case let .deposit(deposit):
        return "Депозит - \(deposit.summ)"
        }
    }
}


class UserDetailsViewController: UIViewController {
    var user: User!
    var bank: Bank!
    var products: [Product]!
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    
    @IBAction func backTapped() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = user.name
        secondNameTextField.text = user.secondName
        lastNameTextField.text = user.lastName
        
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: "Cell")
        products = bank.allProducts(user: user)
        tableView.dataSource = self
        
        
    }
    
    
    
}


extension UserDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name + " " + product.id
        let productFormatter = ProductFormatter()
        cell.detailTextLabel?.text = productFormatter.format(product: product)
        return cell
        
    }
    
    
    
}
