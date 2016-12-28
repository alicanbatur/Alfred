//
//  BaseNavigaitonController.swift
//  Alfred
//
//  Created by Ali Can Batur on 28/12/16.
//  Copyright © 2016 alikoo. All rights reserved.
//

import UIKit

class BaseNavigaitonController: UINavigationController {

    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alfred.getUserFromGithub(name: "github", success: { (result) in
            print("result")
        })
    
    }

}
