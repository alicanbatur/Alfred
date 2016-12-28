//
//  GithubRouter.swift
//  Alfred
//
//  Created by Ali Can Batur on 28/12/16.
//  Copyright © 2016 alikoo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


enum GithubRouter: URLRequestConvertible {
    
    static let baseURLString = "https://api.github.com"
    
    case getUser(String)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .getUser:
                return .get
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .getUser:
                return nil
            }
        }()
        
        let url:URL = {
            // build up and return the URL for each endpoint
            let relativePath:String?
            switch self {
            case .getUser(let name):
                relativePath = "/users/\(name)"
            }
            
            var url = URL(string: GithubRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}
