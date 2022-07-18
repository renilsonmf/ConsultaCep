//
//  ResultCepView.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation
import UIKit

class ResultCepView: UIView {
        
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [streetLabel, districtLabel, cityLabel, stateLabel, dddLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.backgroundColor = .darkGray
        stack.layer.cornerRadius = 10
        stack.spacing = 10
        stack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy var streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Rua"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var districtLabel: UILabel = {
        let label = UILabel()
        label.text = "Bairro"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Cidade"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.text = "Estado"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dddLabel: UILabel = {
        let label = UILabel()
        label.text = "ddd"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
}
