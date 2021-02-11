//
//  EmpDProtocol.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit


protocol EmployeeDetailViewInputProtocol: AnyObject {
    var presenter: EmployeeDetailViewOutput? { get set }
    
    func showDetails(of employee: Employee)
    func updateFavouriteButton(with image: UIImage)
}

protocol EmployeeDetailViewOutput: AnyObject {
    func fetchEmployeeDetails()
    func userTappedOnFavouriteButton()
}

protocol EmployeeDetailModuleProtocol: AnyObject {
    
    var view: EmployeeDetailViewInputProtocol? {get set}
    var interactor: EmployeeDetailInteractorInputProtocol? { get set }
    var router: EmployeeDetailRouterProtocol? {get set}
}

protocol EmployeeDetailInteractorInputProtocol: AnyObject {
    
}

protocol EmployeeDetailInteractorOutputProtocol: AnyObject {
    
}

protocol EmployeeDetailRouterProtocol: AnyObject {
    
}
