//
//  HomeTableViewController.swift
//  Alfred
//
//  Created by Ali Can Batur on 28/12/16.
//  Copyright © 2016 alikoo. All rights reserved.
//

import UIKit

enum Example: Int {
    case Github
}

class HomeTableViewController: UITableViewController {
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case Example.Github.rawValue:
            fetchGithubUserValue(name: "github")
            break
        default:
            break
        }
    }
    
    // MARK: Private Funcs
    
    func fetchGithubUserValue(name: String) {
        // Example for simple "GET" method.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alfred.getUserFromGithub(name: name).then { response in
            self.prettyPrintJson(jsonDict: response.dict)
            }.always {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }.catch { (error) in
                print("\(error.localizedDescription)")
        }
    }
    
    func prettyPrintJson(jsonDict: [String: Any]?) {
        guard let jsonDict = jsonDict else {
            print("jsonDict is nil")
            return
        }
        do {
            let prettyJsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
            let prettyPrintedJson = NSString(data: prettyJsonData, encoding: String.Encoding.utf8.rawValue)
            print("\(prettyPrintedJson!)")
        } catch {
            print(error)
        }
    }
}
