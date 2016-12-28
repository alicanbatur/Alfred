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

class Alfred {
    
    typealias errorHandler = (_ error: Error) -> ()
    
    class func getUserFromGithub(name: String,
                           success: ((_ result: GithubResponse) -> ()),
                           failure: (errorHandler) = { _ in }) {
        Alamofire.request(GithubRouter.getUser(name)).responseObject { (response: DataResponse<GithubResponse>) in
            let githubResponse = response.result.value
            print(githubResponse?.bio)
        }
    }
    
}
