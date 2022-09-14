//
//  CepModel.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation

struct CepModel: Codable {
        
    var cep: String = ""
    var logradouro: String = ""
    var complemento: String = ""
    var bairro: String = ""
    var localidade: String = ""
    var uf: String = ""
    var ibge: String = ""
    var gia: String = ""
    var ddd: String = ""
    var siafi: String = ""
}
