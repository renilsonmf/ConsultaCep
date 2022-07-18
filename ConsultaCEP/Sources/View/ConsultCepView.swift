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
        label.text = "Consulte Aqui"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
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
        button.backgroundColor = .systemBlue
        button.setTitle("buscar", for: .normal)
        button.addTarget(self, action: #selector(didTapButtonSearch), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapButtonSearch() {
        delegate?.didTapSearch(cep: cepTextField.text ?? "")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(cepTextField)
        addSubview(searchButton)
        
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
