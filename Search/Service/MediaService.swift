//
//  MediaService.swift
//  Search
//
//  Created by Mac on 10/4/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class MediaService{
    
    let manager = NetworkManager()
    
    typealias singleMediaResult = (Result<[[String: AnyObject]],APIError>) -> ()
    
    private func getEntity(with term: String, entity: Entity, completion: @escaping singleMediaResult ){
        let query = [URLQueryItem(name: Keys.term, value: term),
                     URLQueryItem(name: Keys.entity, value: entity.entityName),
                     URLQueryItem(name: Keys.limit, value: "5")]
        manager.getData(queries: query) { (result) in
            switch result{
            case .success(let dict):
                if let results = dict["results"] as? [[String: AnyObject]] {
                    completion(.success(results))
                } else {
                    completion(.failure(.jsonConversionFailure))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    typealias searchResultDict = ([String: [SearchResult]]) -> Void
    
    typealias result = (Result<[Hello], APIError>) -> Void
    
    
    func getResult(with term: String, types: [MediaType], completion: @escaping result){
        
        var error: APIError?
        
        var hello : [Hello] = []
        
        let op1 = BlockOperation {
            let group = DispatchGroup()
            for type in types{
                group.enter()
                self.getEntity(with: term, entity: type.entity, completion: { (result) in
                    switch result{
                    case .success(let data):
                        let obj = Hello(entity: type.entity, dict: data)
                        hello.append(obj)
                    case .failure(let err):
                        error = err
                    }
                    group.leave()
                })
            }
            group.wait()
        }
        
        let op2 = BlockOperation {
            DispatchQueue.main.async {
                if let err = error , hello.isEmpty {
                    completion(.failure(err))
                } else {
                    completion(.success(hello))
                }
            }
        }
        op2.addDependency(op1)
        
        op1.start()
        op2.start()
    }
    
    
    
}

