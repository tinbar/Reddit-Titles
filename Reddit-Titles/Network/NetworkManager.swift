//
//  NetworkManager.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-16.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    private init() {
    }
    
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
}


extension NetworkManager {
    
    func requestRedditTitles(completion: @escaping ([String]?, Error?) -> Void) -> DataRequest {
        let endPoint = "https://www.reddit.com/.json"
        let request = Alamofire.request(endPoint)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    if let data = response.data {
                        do {
                            let json = try JSON(data: data)
                            let children = json["data"]["children"].arrayValue
                            let titles = children.map({ (child) -> String in
                                return (child.dictionaryValue["data"]?.dictionaryValue["title"]?.stringValue) ?? ""
                            })
                            completion(titles, nil)
                        } catch {
                            completion(nil, nil)
                        }
                        
                    }
                case .failure(let error):
                    print(error)
                }
        }
        return request
    }
}
