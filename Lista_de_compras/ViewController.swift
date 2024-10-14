//
//  ViewController.swift
//  Lista_de_compras
//
//  Created by Eliardo Venancio on 14/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var inputListItem: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Digite o nome do item"
        input.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        input.textAlignment = .center
        input.backgroundColor = .white
        input.layer.cornerRadius = 10
        
        return input
    }()
    
    private lazy var buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private lazy var divider: UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .white
        
        return divider
    }()
    
    private lazy var labelList: UILabel = {
        let labelList = UILabel()
        labelList.translatesAutoresizingMaskIntoConstraints = false
        labelList.text = "Itens já adicionados: "
        labelList.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        labelList.textColor = .white
        
        
        return labelList
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        setUpView()
        
        buttonAdd.addTarget(self, action: #selector(addItem), for: .touchUpInside)
    }
    
    private func setUpView(){
        setHierarchy()
        setConstrants()
    }
    
    private func setHierarchy(){
        view.addSubview(inputListItem)
        view.addSubview(buttonAdd)
        view.addSubview(divider)
        view.addSubview(labelList)
        view.addSubview(stackView)
    }
    
    private func setConstrants(){
        NSLayoutConstraint.activate([
            inputListItem.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            inputListItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputListItem.heightAnchor.constraint(equalToConstant: 45),
            inputListItem.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputListItem.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            buttonAdd.topAnchor.constraint(equalTo: inputListItem.bottomAnchor, constant: 20),
            buttonAdd.widthAnchor.constraint(equalToConstant: 150),
            buttonAdd.heightAnchor.constraint(equalToConstant: 40),
            buttonAdd.centerXAnchor.constraint(equalTo:view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 20),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            divider.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            labelList.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            labelList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: labelList.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func addItem() {
        guard let itemText = inputListItem.text, !itemText.isEmpty else {
            return
        }
        
        let itemLabel = UILabel()
        itemLabel.text = itemText
        itemLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        itemLabel.textColor = .white
        
        stackView.addArrangedSubview(itemLabel)
        
        inputListItem.text = ""
    }
    
}

