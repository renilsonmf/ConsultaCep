//
//  ViewController.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import UIKit
import Foundation

class ConsultCepViewController: UIViewController {

    private let contentView = ConsultCepView()
    private var viewModel: ConsultCepProtocol
    
    init(viewModel: ConsultCepProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }

}

extension ConsultCepViewController: TapButtonsProtocol {
    func didTapSearch(cep: String) {
        viewModel.fetchCep(cep: cep) { [ weak self ] result, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                guard let self = self else { return }
                if error != true {
                    self.contentView.requestCepSuccess(false, result)
                } else {
                    self.contentView.requestCepSuccess(true, result)
                }
            }
        }
    }
}


