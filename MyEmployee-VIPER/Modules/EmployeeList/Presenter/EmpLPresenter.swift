//
//  EmpLPresenter.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation

final class EmpListPresenter: EmployeeListModuleInput, EmployeeListViewOutput {
    
    weak var view: EmployeeListViewInput?
    var interactor: EmployeeListInteractorInput!
    var router: EmployeeListRouterInput!
    
    var empListViewModel: EmpListViewModel!
    
    //MARK: EmployeeViewOutput
    
    func getEmpList() {
        view?.changeViewState(.loading)
        interactor.loadEmpList()
    }
    
    func didSelectEmployee(at index: Int) {
        let employee = empListViewModel.employees[index]
        let employeeViewModel = EmployeeDetailViewModel(employee, _index: index)
        router.showEmployeeDetails(with: employeeViewModel, delegate: self)
    }
    
    func userDidTapOnFavourite(at index: Int) {
        let isFavourite = self.empListViewModel.employees[index].isFavourite
        self.empListViewModel.employees[index].isFavourite = !isFavourite
        view?.reloadCell(at: index, viewModel: empListViewModel)
    }
    
}

extension EmpListPresenter: EmployeeListInteractorOutput{
    
    // MARK: EmployeeInteractorOutput
    func getEmpLSuccess(_ empLBase: [Employee]?) {
        guard let employee = empLBase else { return }

        empListViewModel = EmpListViewModel(_employees: employee)

        DispatchQueue.main.async { [unowned self] in
            self.view?.displayEmployees(with: self.empListViewModel)
            self.view?.changeViewState(.content)
        }
    }
    
    func getEmpLError(_ error: NetworkError) {
        DispatchQueue.main.async {
            self.view?.changeViewState(.error(error.description))
        }
    }
    
}

// MARK: Delegate Method of UpdateFavouriteDelegate

extension EmpListPresenter: UpdateFavouriteDelegate {
    func userTappedOnFavouriteButton(viewModel: EmployeeDetailViewModel) {
        empListViewModel.employees[viewModel.index] = viewModel.employee
        view?.reloadCell(at: viewModel.index, viewModel: empListViewModel)
    }
}
