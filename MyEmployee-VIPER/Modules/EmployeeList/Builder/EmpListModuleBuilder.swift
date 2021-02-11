//
//  EmpLModuleBuilder.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation


protocol EmpListModuleBuilderProtocol: AnyObject {
    func buildModule() -> EmpListVC
}

// MARK: Entry Point of the application

final class MoviesModuleBuilder: EmpListModuleBuilderProtocol {
    
    func buildModule() -> EmpListVC {
        let empListVC = EmpListVC()
        let presenter = EmpListPresenter()
        let network = NetworkAPIClient()
        let interactor = EmpListIneractor(network: network)
        let router = EmpListRouter()
        
        presenter.view = empListVC
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        empListVC.presenter = presenter
        router.viewController = empListVC
        
        return empListVC
    }
}
