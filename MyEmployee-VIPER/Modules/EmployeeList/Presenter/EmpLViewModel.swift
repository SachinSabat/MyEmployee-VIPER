//
//  EmpLViewModel.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation

struct EmpListViewModel {
    
    var employees: [Employee] = []
    
    init(_employees: [Employee]) {
        employees = _employees
    }
    
    // Checks whether its empty
    var isEmpty: Bool {
        return employees.isEmpty
    }
    
    // Returns employee count
    var employeesCount: Int {
        return employees.count
    }
  
}

extension EmpListViewModel {
    // To check employee at index
    func employeeAt(_ index: Int) -> Employee {
        guard !employees.isEmpty else {
            fatalError("No employee available")
        }
        return employees[index]
    }
}
