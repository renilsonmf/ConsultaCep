//
//  Coordinator.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
