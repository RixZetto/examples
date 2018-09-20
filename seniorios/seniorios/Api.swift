//
//  Api.swift
//  seniorios
//
//  Created by Ricardo Rodríguez on 9/20/18.
//  Copyright © 2018 seniorios. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
class Api {
    
    static func list(  ) {
        
        let params = ["Date": 1]
        
        let url : String = "https://shoppinglandia.com/goodlooks/API/categoriesbyservice/categoriesbyservice_app_getAll"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(response!)
            
        }
        
        task.resume()
    }
    
    static func listData(completion: ((_ isSuccess: Bool, _ data: [ElementDTO]?, _ error: Error?) -> Void)?) {
        let url : URLConvertible = "https://shoppinglandia.com/goodlooks/API/categoriesbyservice/categoriesbyservice_app_getAll"
        let params = ["CategoryID": 20, "ServiceID": 0, "CountryID": 10, "UserID": 151]
        Alamofire.request(url, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseArray { (response: DataResponse<[ElementDTO]>) in
            if response.result.isSuccess {
                completion?(response.result.isSuccess, response.result.value, nil)
            }
            else {
                completion?(response.result.isSuccess, nil, response.result.error)
            }
        }
        
    }
    
}
