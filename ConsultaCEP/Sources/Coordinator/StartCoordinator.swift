//
//  StartCoordinator.swift
//  ConsultaCEP
//
//  Created by Renilson Moreira on 16/07/22.
//

import Foundation
import UIKit

class StartCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ConsultCepViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
    
}
