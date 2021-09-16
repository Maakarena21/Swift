

import UIKit

struct CreateProductInfo: Equatable {
    static func == (lhs: CreateProductInfo, rhs: CreateProductInfo) -> Bool {
        lhs.productName == rhs.productName && lhs.id == rhs.id
    }
    let productName: String
    let id: String
    let selected: Bool
}

struct ProductViewState {
    let addMoneyTextField: String?
    let productInfo: [CreateProductInfo]
}

protocol ProductView: AnyObject {
    func display()
    var viewState: ProductViewState {get set}
}

class CreateProductViewController: UIViewController {

    var viewState = ProductViewState(addMoneyTextField: nil, productInfo: []) {
        didSet {
            if oldValue.productInfo != viewState.productInfo {
                for(index , element) in viewState.productInfo.enumerated() {
                    segmentControl.insertSegment(withTitle: element.productName, at: index, animated: false)
                }
            }
        }
    }
    
    
    var presenter: CreateProductPresenter!
    
    let createProductButton = UIButton()
    let stackView = UIStackView()
    let addMoneyTextField = UITextField()
    var segmentControl = UISegmentedControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
        view.backgroundColor = .white
    }
    
    
    
    @objc func createProductBtn() {
        var copy = [CreateProductInfo]()
        for(index, element) in viewState.productInfo.enumerated() {
                let info = CreateProductInfo(productName: element.productName, id: element.id, selected: index == segmentControl.selectedSegmentIndex)
                copy.append(info)
            
        }
        viewState = ProductViewState.init(addMoneyTextField: addMoneyTextField.text, productInfo: copy)
        presenter.createProductButtonTapped()
    }
    
}


extension CreateProductViewController: ProductView {

    func display() {
        addViews()
        setupViewElements()
    }
    
    func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(segmentControl)
        stackView.addArrangedSubview(addMoneyTextField)
        stackView.addArrangedSubview(createProductButton)
        stackView.setCustomSpacing(64, after: segmentControl)
        stackView.setCustomSpacing(16, after: addMoneyTextField)
        
    }
    
    func setupViewElements() {
        setupStackView()
        setupCreateProductButton()
        setupAddMoneyTextField()
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
               
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
               ])
        
    }
    
    func setupAddMoneyTextField() {
        addMoneyTextField.placeholder = "Добавить денег на счет"
        addMoneyTextField.layer.cornerRadius = 5.0
        addMoneyTextField.layer.borderWidth = 1.0
        addMoneyTextField.layer.borderColor = UIColor.black.cgColor
        addMoneyTextField.translatesAutoresizingMaskIntoConstraints = false

        
    }
    
    func setupCreateProductButton() {
        createProductButton.addTarget(self, action: #selector(createProductBtn), for: .touchUpInside)
        createProductButton.setTitle("Cоздать продукт", for: .normal)
        
        createProductButton.backgroundColor = .systemFill
        createProductButton.layer.cornerRadius = 12
        createProductButton.layer.masksToBounds = true
        createProductButton.setTitleColor(.darkText, for: .highlighted)
        createProductButton.setImage(UIImage(systemName: "folder"), for: .normal)
        createProductButton.tintColor = .black
        
        createProductButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
