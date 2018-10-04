//
//  NetworkManager.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class NetworkManager{
    
    
    
    func getData(queries : [URLQueryItem], completion: @escaping (Result<[String: AnyObject], APIError>) -> Void ){
        var urlComponent = URLComponents()
        urlComponent.host = Endpoint.BASE_URL
        urlComponent.path = "/" + Endpoint.PATH
        urlComponent.scheme = "https"
        urlComponent.queryItems = queries
        var req = URLRequest(url: urlComponent.url!)
        req.httpMethod = RequestType.get.rawValue
        let task = URLSession.shared.dataTask(with: req) { (data, response, err) in
            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(Result.failure(.requestFailed))
            }
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    return completion(Result.failure(.invalidData))
                }
                // We can do swift 4 codable protocol also
                // here we are fetching the data for each media type and saving into single model
                // using old one is easier
                
                /*
                do {
                    let result = JSONDecoder().decode([SearchResult.self], from: data)
                } catch {
                    completion(Result.failure(.jsonConversionFailure))
                }  */
                
                
                
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]{
                        print(jsonResult)
                        completion(Result.success(jsonResult))
                    } else {
                        completion(Result.failure(.jsonConversionFailure))
                    }
                } catch{
                    completion(Result.failure(.jsonConversionFailure))
                }
                
            } else {
                completion(Result.failure(APIError.responseUnsuccessful))
            }
        }
        task.resume()
    }
    
}



struct Endpoint{
    
    static let BASE_URL = "itunes.apple.com"
    static let PATH = "search"
}


enum RequestType : String{
    case post = "POST"
    case get = "GET"
}

enum Result<T, U> where U : Error{
    case success(T)
    case failure(U)
}
