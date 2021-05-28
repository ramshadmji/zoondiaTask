//
//  ApiManager.swift
//  ProductApp
//
//  Created by Mohammed Ramshad K on 28/05/21.
//

import Foundation
import Alamofire
class ApiManager {
    func callingProductApi(url: String, success:  @escaping (Product)->Void, failure: @escaping (Error)->Void){
        guard let Url = URL(string: url) else {return}
        AF.request(Url).responseJSON { response in
            if let error = response.error{
                failure(error)
                return
            }
            switch response.result {
                    case .success:
                        
                        guard let data = response.data else {
                            return
                        }
                        let decoder = JSONDecoder()

                        if let json = try? decoder.decode(Product.self, from: data) {
                            success(json)
                        }
                    break
                    case .failure(let error):
                        failure(error)
                        break
                        // error handling
                    }
            debugPrint(response)
            }
        }
    
    }

