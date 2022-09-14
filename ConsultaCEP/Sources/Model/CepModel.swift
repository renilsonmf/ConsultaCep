//
//  CepModel.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation

struct CepModel: Codable {
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let uf: String
    let ibge: String
    let gia: String
    let ddd: String
    let siafi: String
    
    init() {
        cep = ""
        logradouro = ""
        complemento = ""
        bairro = ""
        localidade = ""
        uf = ""
        ibge = ""
        gia = ""
        ddd = ""
        siafi = ""
    }
}
