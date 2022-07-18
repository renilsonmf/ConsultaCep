//
//  CepModel.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation

struct CepModel: Codable {
    let cep, logradouro, complemento, bairro: String
    let localidade, uf, ibge, gia: String
    let ddd, siafi: String
}
