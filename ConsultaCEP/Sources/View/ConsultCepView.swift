//
//  ConsultaCepView.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation
import UIKit

protocol TapButtonsProtocol: NSObject {
    func didTapSearch(cep: String)
}

class ConsultCepView: UIView {
    
    weak var delegate: TapButtonsProtocol?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Busque seu CEP"
        label.textColor = .yellow
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cepTextField: UITextField = {
        let textField = UITextField()
        var bottomLine = CALayer()
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "informe o cep",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setBottomBorder()
        textField.setTopPadding()
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPink
        button.setTitle("procurar", for: .normal)
        button.addTarget(self, action: #selector(didTapButtonSearch), for: .touchUpInside)
        return button
    }()
    
    lazy var resultCepView: ResultCepView = {
        let view = ResultCepView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var errorCepLabel: UILabel = {
        let label = UILabel()
        label.text = "CEP Invalido"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func didTapButtonSearch() {
        delegate?.didTapSearch(cep: cepTextField.text ?? "")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(cepTextField)
        addSubview(searchButton)
        addSubview(resultCepView)
        addSubview(errorCepLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cepTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 58),
            cepTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cepTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cepTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 40),
            searchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -68),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            resultCepView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 40),
            resultCepView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            resultCepView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            errorCepLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 40),
            errorCepLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            errorCepLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
}

extension UITextField {
    
    func setTopPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    public func setBottomBorder() {
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
