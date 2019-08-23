//
//  APIManger.swift
//  TaKol?
//
//  Created by 3Mr on 7/25/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class APIManager {
    //Static equal Class
    static func getRestaurants(completion: @escaping (_ error: String?, _ restaurants: [Restaurant]?) -> Void) {
        let url = "https://takol2.000webhostapp.com/api/restaurants"
        //Request
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {(response) in
            switch response.result {
            case.failure(let error):
                print("Error while fetching data: \(error.localizedDescription)")
                completion(error.localizedDescription,nil)
            case.success(_):
                guard let data = response.data else {
                    print("Error while fetching data: didnt get any data")
                    completion("Error while fetching data: didnt get any data",nil)
                    return
                }
                do {
                    let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                    completion(nil, restaurants)
                } catch {
                    print(error.localizedDescription)
                    completion(error.localizedDescription,nil)
                    
                }
            }
        }
    }
    
}
