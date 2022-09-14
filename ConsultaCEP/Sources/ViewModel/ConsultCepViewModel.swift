//
//  ConsultCepViewModel.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 14/09/22.
//

import Foundation

protocol ConsultCepProtocol {
    func fetchCep(cep: String, completion: @escaping (CepModel, Bool) -> ())
}

class ConsultCepViewModel: ConsultCepProtocol {
    func fetchCep(cep: String, completion: @escaping (CepModel, Bool) -> ()) {
        let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, erro in
            guard let responseData = data else { return }
            
            do {
                let questions = try JSONDecoder().decode(CepModel.self, from: responseData)
                completion(questions, false)
            } catch {
                completion(CepModel(), true)
            }
        }
        task.resume()
    }
}
