//
//  ViewController.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import UIKit

class ConsultCepViewController: UIViewController {

    let contentView = ConsultCepView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    func makeRequest(cep: String, completion: @escaping (CepModel, Bool) -> ()) {
        let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, erro in
            guard let responseData = data else { return }
            
            do {
                let questions = try JSONDecoder().decode(CepModel.self, from: responseData)
                completion(questions, false)
            } catch let questions {
                completion(CepModel(), true)
            }
        }
        task.resume()
    }

}

extension ConsultCepViewController: TapButtonsProtocol {
    func didTapSearch(cep: String) {
        makeRequest(cep: cep) { [ weak self ] result, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if error != true {
                    self.contentView.resultCepView.isHidden = false
                    self.contentView.errorCepLabel.isHidden = true
                    self.contentView.resultCepView.setupValues(cep: result)
                } else {
                    self.contentView.resultCepView.isHidden = true
                    self.contentView.errorCepLabel.isHidden = false
                }
            }
        }
    }
}


