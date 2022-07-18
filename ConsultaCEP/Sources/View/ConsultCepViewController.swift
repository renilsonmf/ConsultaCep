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
    
    func makeRequest(cep: String, completion: @escaping (CepModel) -> ()) {
        let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let responseData = data else { return }
            
            do {
                let questions = try JSONDecoder().decode(CepModel.self, from: responseData)
                completion(questions)
            } catch let error {
                print("error", error)
            }
        }
        task.resume()
    }

}

extension ConsultCepViewController: TapButtonsProtocol {
    func didTapSearch(cep: String) {
        makeRequest(cep: cep) { cep in
            DispatchQueue.main.async {
                self.contentView.resultCepView.setupValues(cep: cep)
            }
        }
        
    }
}


