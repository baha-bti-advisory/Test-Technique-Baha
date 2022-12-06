//
//  JetBrainService.swift
//  Test Technique Baha
//
//  Created by Bahaeddine Boulaabi on 06/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class JetBrainService {
    
    static let instance = JetBrainService()
    var jetBrainArray = [JetBrainModel]()
    
    // MARK: --Fetch Data
    func getJetBrain(completion: @escaping CompletionHandlers) {
        
        AF.request(BASE_URL, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            if response.error == nil {
                self.jetBrainArray.removeAll()
                guard let data = response.data else { return }
                let json = try! JSON(data: data)
                
                let jetBrain = json.arrayValue
                for item in jetBrain {
                    let fullName = item["full_name"].stringValue
                    let forks = item["forks"].intValue
                    let openIssues = item["open_issues"].intValue
                    let watchers = item["watchers"].intValue
                    let description = item["description"].stringValue
                    
                    let jetBrainItem = JetBrainModel(fullName: fullName, forks: forks, openIssues: openIssues, watchers: watchers, description: description)
                    self.jetBrainArray.append(jetBrainItem)
                }
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
}
