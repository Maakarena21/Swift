import UIKit



struct ProductInfo {
    let productName: String
    let productType: String
}

struct ProductState {
    let products: [ProductInfo]
}

protocol UserDetailsView: AnyObject {
    func display(fullName: String, secondName: String, lastName: String)
    var currentState: ProductState? {get set}
}

class UserDetailsViewController: UIViewController {
       
    
    var currentState: ProductState? {
        didSet {
            productTableView.reloadData()
        }
    }
    var presenter: UserDetailsPresenter!
    
        let stackView = UIStackView()
        let fullNameLabel = UILabel()
        let secondNameLabel = UILabel()
        let lastNameLabel = UILabel()
        let productTableView = UITableView()
        let createProductButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.dataSource = self
        productTableView.delegate = self
        presenter.viewLoaded()
        view.backgroundColor = .white
    }
    
    @objc private func createDepositButton() {
        view.endEditing(true)
        presenter.createProductButtonTapped()
    }
}
extension UserDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentState?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath)
        cell.textLabel?.text = currentState?.products[indexPath.row].productName
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        
        
        cell.detailTextLabel?.text = currentState?.products[indexPath.row].productType
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
        
    }
}
extension UserDetailsViewController: UserDetailsView {
    func display(fullName: String, secondName: String, lastName: String) {
        fullNameLabel.text = fullName
        secondNameLabel.text = secondName
        lastNameLabel.text = lastName

        
        addViews()
        setupViewElements()
        productTableView.register(ProductCell.self, forCellReuseIdentifier: "NewCell")
        productTableView.dataSource = self
       
    }
    
    private func addViews() {
        view.addSubview(stackView)
        stackView.addSubview(fullNameLabel)
        stackView.addSubview(secondNameLabel)
        stackView.addSubview(lastNameLabel)
        stackView.addSubview(productTableView)
        stackView.addSubview(createProductButton)
    }
    
    private func setupViewElements() {
        setupStackView()
        setupFullNameLabel()
        setupSecondNameLabel()
        setupLastNameLabel()
        setupProductTableView()
        setupCreateProductButton()
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
               
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
               ])
        
    }
    
    private func setupFullNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        NSLayoutConstraint.activate([
            
            fullNameLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 45),
            fullNameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
            
        ])
        
    }
    
    private func setupSecondNameLabel() {
        secondNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secondNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
               NSLayoutConstraint.activate([
                secondNameLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
                secondNameLabel.heightAnchor.constraint(equalTo: fullNameLabel.heightAnchor),
                secondNameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
                
               ])
        
    }
    
    private func setupLastNameLabel() {
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
               NSLayoutConstraint.activate([
                lastNameLabel.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 15),
                lastNameLabel.heightAnchor.constraint(equalTo: fullNameLabel.heightAnchor),
                lastNameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
               ])
    }
    
    private func setupProductTableView() {
        productTableView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                
                productTableView.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 15),
                productTableView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
                productTableView.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
               ])
        
    }
    
    private func setupCreateProductButton() {
        createProductButton.addTarget(self, action: #selector(createDepositButton), for: .touchUpInside)
        createProductButton.setTitle("Cоздать продукт", for: .normal)
        createProductButton.backgroundColor = .systemOrange
        createProductButton.layer.cornerRadius = 12
        createProductButton.layer.masksToBounds = true
        createProductButton.setTitleColor(.white, for: .normal)
        createProductButton.setImage(UIImage(systemName: "folder"), for: .normal)
        createProductButton.tintColor = .black
        
        createProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                createProductButton.topAnchor.constraint(equalTo: productTableView.bottomAnchor, constant: 80),
                createProductButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
               ])
    }
    
    
}
extension UserDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellTappedButton(indexPath: indexPath)
    }
}
