//
//  GithubResponse.swift
//  Alfred
//
//  Created by Ali Can Batur on 28/12/16.
//  Copyright © 2016 alikoo. All rights reserved.
//

import ObjectMapper

class GithubResponse: Mappable {
    
    var dict: [String: Any]?
    
    var login: String?
    var id: Int?
    var avatarUrl: String?
    var url: String?
    var htmlUrl: String?
    var bio: String?
    
    required init?(map: Map) {
        // Do nothing.
    }
    
    func mapping(map: Map) {
        dict = map.JSON
        login <- map["login"]
        id <- map["id"]
        avatarUrl <- map["avatar_url"]
        url <- map["url"]
        htmlUrl <- map["html_url"]
        bio <- map["bio"]
    }
    
}

