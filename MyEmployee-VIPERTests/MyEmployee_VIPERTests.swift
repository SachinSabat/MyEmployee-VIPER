//
//  MyEmployee_VIPERTests.swift
//  MyEmployee-VIPERTests
//
//  Created by Sachin Sabat on 08/02/21.
//

import XCTest
@testable import MyEmployee_VIPER

class MyEmployee_VIPERTests: XCTestCase {
    
    let storedEmployee = TestUtil().getEmployees()

    class FakeInteractionOutput: EmployeeListInteractorOutput {
        
        var employee: [Employee]?
        var error: NetworkError?
        
        func getEmpLSuccess(_ empLBase: [Employee]?) {
            self.employee = empLBase
        }
        
        func getEmpLError(_ error: NetworkError) {
            self.error = error
        }
    }
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testCaseOne() {
        let employee = EmpListViewModel(_employees: storedEmployee)
        XCTAssertEqual(employee.employees.count, 1)
        XCTAssertEqual(employee.employeesCount, 10)
        XCTAssertTrue(employee.isEmpty)
        XCTAssertEqual(employee.employeeAt(1).name, "Sachin")
        XCTAssertEqual(employee.employeeAt(1).name, "Ervin Howell")
        
    }
    
    func testCaseTwo() {
        let employee = EmpListViewModel(_employees: storedEmployee)
        XCTAssertTrue(employee.employeesCount > 0)
    }
}

class TestUtil {
    func getEmployees() -> [Employee] {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: "Employee", withExtension: "json")!
        let data = try! Data(contentsOf: fileUrl)
        let employeeBase = try! JSONDecoder().decode([Employee].self, from: data)
        return employeeBase
    }
}

