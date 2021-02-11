//
//  EmpLRouter.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit

final class EmpListRouter: EmployeeListRouterInput {
    
    weak var viewController: UIViewController?
    
    // Function for Push to next controller with DataModel and Delegate for fav item clicked

    func showEmployeeDetails(with employee: EmployeeDetailViewModel,delegate: UpdateFavouriteDelegate) {

        let employeeDetailsVC = EmployeeDetailsModuleBuilder().buildModule(with: employee, delegate: delegate)
        viewController?.navigationController?.pushViewController(employeeDetailsVC, animated: true)
    }
    

}
