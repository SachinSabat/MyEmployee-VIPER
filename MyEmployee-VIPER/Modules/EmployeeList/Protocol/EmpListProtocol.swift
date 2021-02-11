//
//  EmpLProtocol.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation
import UIKit


//MARK: BaseViewInput

protocol BaseViewInput: AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension BaseViewInput where Self: UIViewController {
    func showSpinner() {
        view.showSpinner()
    }
    
    func hideSpinner() {
        view.hideSpinner()
    }
}

//MARK: Presenter - View
protocol EmployeeListViewInput: BaseViewInput {
    var presenter: EmployeeListViewOutput! { get set }
    
    func changeViewState(_ state: ViewState)
    func displayEmployees(with viewModel: EmpListViewModel)
    func reloadCell(at index: Int, viewModel: EmpListViewModel)

}

//MARK: View - Presenter
protocol EmployeeListModuleInput: AnyObject {
    var view: EmployeeListViewInput? { get set }
    var interactor: EmployeeListInteractorInput! { get set }
    var router: EmployeeListRouterInput! { get set }
}
// View - Presenter
protocol EmployeeListViewOutput: AnyObject {
    func getEmpList()
    func didSelectEmployee(at index: Int)
    func userDidTapOnFavourite(at index: Int)
}

//MARK: Presenter - InteractorInput
protocol EmployeeListInteractorInput: AnyObject {
    var presenter: EmployeeListInteractorOutput? { get set }
    
    func loadEmpList()
}

// Interector - Presenter
protocol EmployeeListInteractorOutput: AnyObject {
    func getEmpLSuccess(_ empLBase: [Employee]?)
    func getEmpLError(_ error: NetworkError)
}

//MARK: Presenter - Router Navigation
protocol EmployeeListRouterInput: AnyObject {
    func showEmployeeDetails(with employee: EmployeeDetailViewModel, delegate: UpdateFavouriteDelegate)
}
