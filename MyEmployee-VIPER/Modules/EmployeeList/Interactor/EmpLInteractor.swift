//
//  EmpLInteractor.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation

class EmpListIneractor: EmployeeListInteractorInput {

    let network: NetworkService
    weak var presenter: EmployeeListInteractorOutput?
    
    init(network: NetworkService) {
        self.network = network
    }
    
    //MARK: Load Movies
    func loadEmpList() {
        let endPoint = MyEmployeeDBAPI.getEmployeeListFor
        network.dataRequest(endPoint, objectType: [Employee].self) { [weak self] (result: Result<[Employee], NetworkError>) in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.presenter?.getEmpLSuccess(response)
            case let .failure(error):
                self.presenter?.getEmpLError(error)
            }
        }
    }
}
