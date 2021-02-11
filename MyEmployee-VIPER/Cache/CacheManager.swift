//
//  CacheManager.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 09/02/21.
//

import Foundation

/// To cache Employee Star
/// Used to cache fav employee
class CacheManager {
    // MARK: Properties
    private let cache = NSCache<NSString, StructWrapper<Employee>>()
    private var keys = [Int]()
    
    static let shared = CacheManager()
    
    // MARK: Init Methods
    private init() {
        cache.countLimit = 10
    }
    
    // MARK: Methods
    /// To insert employee in cache
    /// - Parameter employee: employee object
    func insert(employee: Employee) {
        if keys.contains(employee.id!) {
            return
        }
        
        if keys.count == 10 {
            removeEmployee(for: keys.first!)
        }
        
      //  cache.setObject(StructWrapper(EmployeeListBase), forKey: employee.id!.description as NSString)
        keys.append(employee.id!)
    }
    
    /// To fetch employee by ID
    /// - Parameter id: employee's id
    /// - Returns: employee for the given id
    func getEmployee(for id: Int) -> Employee? {
        if let empVal = cache.object(forKey: id.description as NSString) {
            print("The object is still cached")
            return empVal.value
        } else {
            print("Web image went away")
            return nil
        }
    }
    
    /// To fetch all the employee
    /// - Returns: array of employee if available
    func fetchAllEmployee() -> [Employee]? {
        var employee: [Employee] = []
        guard !keys.isEmpty else {
            return nil
        }
        for key in keys.reversed() {
            if let empVal = getEmployee(for: key) {
                employee.append(empVal)
            }
        }
        return employee
    }
    
    /// Remove employee
    /// - Parameter id: employee's id
    func removeEmployee(for id: Int) {
        if let index = keys.firstIndex(of: id) {
            keys.remove(at: index)
        }
        cache.removeObject(forKey: id.description as NSString)
    }
}
