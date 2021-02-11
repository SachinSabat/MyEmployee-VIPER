//
//  URLRequestConvertible.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}


extension URLRequestConvertible where Self: APIEndPoint {
    
    func asURLRequest() throws -> URLRequest {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        
        components?.path = path
        
        guard let url = components?.url else {
            let URL = baseURL
            throw NetworkError.invalidRequestURL(URL.appendingPathComponent(path))
        }
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        request.httpMethod = method.rawValue
        request.setHeaders(headers)
        return request
    }
}

extension URLRequest {
    mutating func setHeaders(_ headers: [String: String]? = nil) {
        guard let headers = headers else {
            return
        }
        headers.forEach {
            setValue($0.key, forHTTPHeaderField: $0.value)
        }
    }
}
