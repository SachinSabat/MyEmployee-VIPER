//
//  EmployeeDetailViewModel.swift
//  MyEmployee-VIPER
//
//  Created by Ajay Bhanushali on 10/02/21.
//

import Foundation

struct EmployeeDetailViewModel {
    var employee: Employee
    var index: Int
    
    init(_ _employee: Employee, _index: Int) {
        employee = _employee
        index = _index
    }
}
