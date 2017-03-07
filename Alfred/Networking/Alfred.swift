//
//  Alfred.swift
//  Alfred
//
//  Created by Ali Can Batur on 28/12/16.
//  Copyright © 2016 alikoo. All rights reserved.
//

import UIKit

import Alamofire
import AlamofireObjectMapper
import PromiseKit

class Alfred {
    
    typealias errorHandler = (_ error: Error?) -> ()
    
    class func getUserFromGithub(name: String) -> Promise<GithubResponse> {
        // Alfred promises to return kind of class GithubResponse
        return Promise { fulfill, reject in
            Alamofire.request(GithubRouter.getUser(name)).responseObject { (response: DataResponse<GithubResponse>) in
                guard let githubResponse = response.result.value else {
                    reject(response.result.error!)
                    return
                }
                fulfill(githubResponse)
            }
        }
    }
    
}
