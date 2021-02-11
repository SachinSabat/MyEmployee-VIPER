//
//  MyEmployeeAPI.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation


enum MyEmployeeDBAPI: APIEndPoint, URLRequestConvertible {
    
    case getEmployeeListFor
 
}

extension MyEmployeeDBAPI {
    
    var baseURL: URL {
        return URL(string: APIConstants.myEmployeeDBAPIBaseURL)!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getEmployeeListFor:
            return "/users"
        }
        
    }
    
}

//MARK: NetworkAPI Constants
enum APIConstants {
    static let myEmployeeDBAPIBaseURL = "https://jsonplaceholder.typicode.com"
}
