//
//  TestVC.swift
//  UIBank
//
//  Created by Silence on 24.08.2021.
//

//import UIKit
//
//
//class MyViewController: UIViewController {
//    let myView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
//
//    let button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Нажми меня", for: .normal)
//        button.addTarget(self, action: #selector(hasBeenTapped), for: .touchUpInside)
//        return button
//    }()
//
//    let label: UILabel = {
//        let label = UILabel()
//        label.text = "Test label"
//        return label
//    }()
//
//    let stack = UIStackView()
//
////    let model = TestModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(myView)
//        view.addSubview(button)
//        view.addSubview(label)
//
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            myView.widthAnchor.constraint(equalToConstant: 100),
//            myView.heightAnchor.constraint(equalToConstant: 100),
//            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            myView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
//        ])
//
//        NSLayoutConstraint.activate([
//            button.heightAnchor.constraint(equalToConstant: 50),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 16)
//        ])
//
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16)
//        ])
//
//        setupStack()
//        view.addSubview(stack)
//        stack.translatesAutoresizingMaskIntoConstraints = false
//
//
//    }
    
//    private func setupStack() {
//
//        for element in model.fields {
//            let textView = UITextField()
//            textView.placeholder = element.placeholder
//            textView.keyboardType = element.isNumber ? .numberPad : .default
//            stack.addArrangedSubview(textView)
//        }
//    }
//
//    @objc
//    private func hasBeenTapped() {
//
//    }
//
//}


