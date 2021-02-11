//
//  EmpDPresenter.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit

protocol UpdateFavouriteDelegate {
    func userTappedOnFavouriteButton(viewModel: EmployeeDetailViewModel)
}


final class EmployeeDetailPresenter: EmployeeDetailModuleProtocol {
    
    weak var view: EmployeeDetailViewInputProtocol?
    var router: EmployeeDetailRouterProtocol?
    var interactor: EmployeeDetailInteractorInputProtocol?
    
    // To pass modelData to EmployeeListRouter
    var viewModel: EmployeeDetailViewModel
    var delegate: UpdateFavouriteDelegate?
    
    init(_ _employee: EmployeeDetailViewModel) {
        viewModel = _employee
    }
    
    deinit {
        print("EmployeeDetailPresenter removed")
    }
    
}

//MARK: EmployeeDetailViewOutput

extension EmployeeDetailPresenter: EmployeeDetailViewOutput {
    func fetchEmployeeDetails() {
        view?.showDetails(of: viewModel.employee)
        view?.updateFavouriteButton(with: viewModel.employee.isFavourite ? #imageLiteral(resourceName: "fav-filled") : #imageLiteral(resourceName: "fav"))
    }
    
    func userTappedOnFavouriteButton() {
        viewModel.employee.isFavourite = !viewModel.employee.isFavourite
        view?.updateFavouriteButton(with: viewModel.employee.isFavourite ? #imageLiteral(resourceName: "fav-filled") : #imageLiteral(resourceName: "fav"))
        delegate?.userTappedOnFavouriteButton(viewModel: viewModel)
    }
}
