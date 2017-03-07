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
        
        let endPoint: String = {
            switch self {
            case .getUser:
                return "/user"
            }
        }()
        
        let urlData: String? = {
            switch self {
            case .getUser(let name):
                return name
            }
        }()
        
        let postData: [String: Any]? = {
            switch self {
            default:
                return nil
            }
        }()
        
        let url:URL = {
            
            var url = URL(string: GithubRouter.baseURLString)!
            url = url.appendingPathComponent(endPoint)
            
            if let urlData = urlData {
                url = url.appendingPathComponent(urlData)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: postData)
    }
}
