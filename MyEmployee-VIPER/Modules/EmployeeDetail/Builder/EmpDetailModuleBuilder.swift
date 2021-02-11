//
//  EmpDModuleBuilder.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation

protocol EmployeeDetailsModuleBuilderProtocol {
    func buildModule(with employee: EmployeeDetailViewModel, delegate: UpdateFavouriteDelegate) -> EmpDetailVC
}

//MARK: EmployeeDetailsModuleBuilderProtocol

final class EmployeeDetailsModuleBuilder: EmployeeDetailsModuleBuilderProtocol {
    
    // Send data to detail page with delegate method
    func buildModule(with employee: EmployeeDetailViewModel, delegate: UpdateFavouriteDelegate) -> EmpDetailVC {
        
        let movieDetailsVC = EmpDetailVC()
        
        let presenter: EmployeeDetailPresenter = EmployeeDetailPresenter(employee)
        movieDetailsVC.presenter = presenter
        presenter.view = movieDetailsVC
        presenter.delegate = delegate
        
        let router: EmployeeDetailRouterProtocol = EmployeeDetailRouter()
        presenter.router = router
        
        return movieDetailsVC
        
    }
}
